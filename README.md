# UX field guide

Do and don't rules for interface design, collected from videos and other
sources, with provenance and a confidence level on each.

- [`INDEX.md`](INDEX.md) lists every rule by category.
- [`rules/`](rules) holds one rule per file.
- [`sources/`](sources) holds one note per video: what it claimed and which
  rules it fed.

## Confidence

| Level | Meaning |
| --- | --- |
| `established` | Backed by research or a widely accepted guideline, or by two independent sources. |
| `single-source` | One source's say-so. Treat as a suggestion. |
| `disputed` | Sources or research disagree. The rule's notes say how. |

## Agent skills

Two skills in [`skills/`](skills) work with Claude Code, Codex, and Cursor:

- **`ux-ingest <url>`** downloads a video, transcribes it, reads its frames,
  turns its claims into new or updated rules, and opens a PR.
- **`ux-review`** applies the rules while building or reviewing a UI.

Setup on macOS:

```sh
brew install yt-dlp ffmpeg whisper-cpp
gh repo clone cvols/ux-field-guide ~/Desktop/projects/personal/ux-field-guide
for s in ux-ingest ux-review; do
  ln -s ~/Desktop/projects/personal/ux-field-guide/skills/$s ~/.agents/skills/$s
done
~/.agents/bin/pstack-sync   # mirrors ~/.agents/skills into ~/.claude/skills
```

The first ingest downloads a Whisper model (about 150 MB) to
`~/.cache/whisper/`.
