---
name: ux-ingest
description: Turn a UX video (YouTube, Instagram, TikTok) into do/don't rules in the ux-field-guide repo and open a PR. Use for "/ux-ingest <url>", "add this video to my UX rules", or when the user shares a UX video link and wants its lessons kept.
---

# UX ingest

Turns one video into rules in the `cvols/ux-field-guide` repo, then opens a PR
for the user to review. The PR is the quality gate, so never push to `main`.

Find the repo root with `git -C <this skill's directory> rev-parse --show-toplevel`.
Scripts below are relative to this skill's directory.

## Steps

1. **Sync.** In the repo root, `git switch main && git pull --ff-only`.
2. **Fetch.** Run `scripts/fetch.sh <url>`. It prints a work directory with:
   - `meta.json`: id, URL, creator, caption, duration.
   - `transcript.txt`: Whisper transcript with timestamps.
   - `sheet-N.jpg`: contact sheets, 7 columns by 4 rows, read left to right.
     `frame-interval` holds the seconds between frames, so frame `k` (from 0)
     on sheet `N` is at `((N-1)*28 + k) * interval` seconds.

   If the download fails on a login wall, ask the user to retry with
   `yt-dlp --cookies-from-browser chrome`, and do not guess the content.
3. **Watch.** Read the caption and transcript, and look at every sheet. Many
   UX videos show the bad and good versions on screen without saying them,
   and on-screen numbers often differ from the narration.
4. **Extract.** List each claim the video makes about interface design. Skip
   anything that is not a rule a designer or engineer could apply, such as
   engagement bait or a story with no lesson. For each claim, note what to
   do, what to avoid, why, the timestamp, and any number or study it cites.
5. **Check.** When a claim cites a study or a named law, search for it.
   Videos often repeat findings that failed to replicate. Treat a number
   that comes from the video's own mockup as an illustration, not data.
6. **Match.** Read `INDEX.md`, then each rule that might cover the same
   ground. For each claim, choose one:
   - **New**: no existing rule covers it. Create `rules/<slug>.md`.
   - **Reinforce**: an existing rule says the same thing. Add the source id,
     add any new example or nuance, and raise confidence if earned.
   - **Conflict**: the claim contradicts a rule. Keep both views in the
     rule's Notes, set confidence to `disputed`, and flag it in the PR.

   Prefer reinforcing over creating. Two rules that differ only in wording
   are a bug.
7. **Write the source note** at `sources/<id>.md` (format below). Paraphrase.
   The repo is public, so do not paste the transcript or more than a short
   phrase of it.
8. **Index.** Run `python3 scripts/index.py`. Fix every error it prints.
9. **PR.** On a branch named `ingest/<id>`, commit with the title
   `Ingest <id>: <creator>, <n> new, <m> updated`, push, and run
   `gh pr create`. The body is a table of rules with the action (new,
   reinforced, conflict), confidence, and one line on why. List skipped
   claims and why under it. End with the user's PR attribution line.

## Rule file

`rules/<slug>.md`. The slug is the title in kebab case.

```md
---
title: Let the next card peek
summary: In a horizontal scroller, show part of the next card so people know there is more.
category: layout
principle: Law of closure
confidence: established
sources: [ig-Del7XTgsuwI]
---

**Do:** Size cards so the next one is cut off by the screen edge, about a
quarter to a third of it visible.

**Don't:** Fit a whole number of cards exactly to the screen width. It reads
as the complete set, and people do not swipe.

**Why:** People complete shapes that are cut off, so a clipped card reads as
part of a row that keeps going.

**Notes:** ig-Del7XTgsuwI (0:02) shows 0% vs 32% of the next card visible.
```

- `title`: an imperative a reader could act on.
- `summary`: one sentence. It appears in `INDEX.md`.
- `category`: one of `layout`, `hierarchy`, `navigation`, `forms`,
  `feedback`, `content`, `choice`, `motion`, `accessibility`, `onboarding`.
- `principle`: the named law or heuristic, or `none`.
- `confidence`:
  - `established`: backed by research or a widely accepted guideline, or by
    two independent sources.
  - `single-source`: one video's say-so.
  - `disputed`: sources or research disagree. Notes says how.
- `sources`: source ids. Each needs a file in `sources/`.
- `Notes` is optional. Use it for evidence, caveats, and conflicts, each
  attributed to a source id and timestamp.

## Source file

`sources/<id>.md`

```md
---
url: https://www.instagram.com/reel/Del7XTgsuwI/
creator: "@motion_ui_interface"
title: Six more UX laws, proven on screen (part 4 of 4)
published: 2026-10-17
ingested: 2026-10-17
---

One paragraph on what the video covers and how it argues.

| Time | Claim | Rule | Action |
| --- | --- | --- | --- |
| 0:02 | Show part of the next card | [let-the-next-card-peek](../rules/let-the-next-card-peek.md) | new |

**Skipped:** claims not turned into rules, and why.
```
