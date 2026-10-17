#!/usr/bin/env bash
# Usage: fetch.sh <video-url>
# Downloads a video, transcribes it, and tiles frames into contact sheets.
# Prints the work directory. Re-running for the same URL reuses what exists.
set -euo pipefail

url=${1:?usage: fetch.sh <video-url>}
model=${WHISPER_MODEL:-$HOME/.cache/whisper/ggml-base.en.bin}

for bin in yt-dlp ffmpeg ffprobe whisper-cli python3; do
  command -v "$bin" >/dev/null || { echo "missing $bin; run: brew install yt-dlp ffmpeg whisper-cpp" >&2; exit 1; }
done
if [ ! -f "$model" ]; then
  mkdir -p "$(dirname "$model")"
  curl -fsSL -o "$model" https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.en.bin
fi

read -r extractor vid < <(yt-dlp --no-warnings --print '%(extractor_key)s %(id)s' "$url" | head -1)
case "$extractor" in
  Youtube*) platform=yt ;;
  Instagram*) platform=ig ;;
  TikTok*) platform=tt ;;
  *) platform=$(echo "$extractor" | tr '[:upper:]' '[:lower:]') ;;
esac
id="$platform-$vid"
dir=${UX_INGEST_DIR:-/tmp/ux-ingest}/$id
mkdir -p "$dir"

if ! ls "$dir"/video.* >/dev/null 2>&1; then
  yt-dlp -q --no-warnings -f 'bv*[height<=720]+ba/b[height<=720]/b' --merge-output-format mp4 \
    --write-info-json -o "$dir/video.%(ext)s" "$url"
fi
video=$(ls "$dir"/video.* | grep -v '\.info\.json$' | head -1)
duration=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$video")

python3 -I - "$dir/video.info.json" "$id" "$duration" > "$dir/meta.json" <<'PY'
import json, sys
info = json.load(open(sys.argv[1]))
keys = ["webpage_url", "uploader", "channel", "uploader_url", "title", "description", "upload_date"]
meta = {"id": sys.argv[2], "duration": round(float(sys.argv[3])), **{k: info.get(k) for k in keys}}
json.dump(meta, sys.stdout, indent=2, ensure_ascii=False)
PY

if [ ! -s "$dir/transcript.txt" ]; then
  ffmpeg -loglevel error -y -i "$video" -ar 16000 -ac 1 "$dir/audio.wav"
  whisper-cli -m "$model" -f "$dir/audio.wav" -np 2>/dev/null > "$dir/transcript.txt"
  rm "$dir/audio.wav"
fi

# At most four 7x4 sheets, one frame every 2s or more.
interval=$(python3 -I -c "import sys; print(max(2, -(-int(float(sys.argv[1])) // 112)))" "$duration")
if ! ls "$dir"/sheet-*.jpg >/dev/null 2>&1; then
  ffmpeg -loglevel error -i "$video" -vf "fps=1/$interval,scale=240:-1,tile=7x4" "$dir/sheet-%d.jpg"
fi
echo "$interval" > "$dir/frame-interval"

echo "$dir"
