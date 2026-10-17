---
title: Count only real progress
summary: In a multi-step flow, credit the steps people have truly finished, and never pad a progress bar or start it at an arbitrary percentage.
category: feedback
principle: Endowed progress effect
confidence: disputed
sources: [yt-2TlIg3VokY8]
---

**Do:** Count what people have already done, such as creating an account,
as a finished step, and show it checked. Size the remaining steps honestly.

**Don't:** Add steps that aren't real, start a bar at an arbitrary
percentage, or make it move fast early and slow later to hide how long the
flow is.

**Why:** Seeing real progress can help people persist. A bar that lies
breaks trust once people notice.

**Spot it:**

- In code: a progress bar with a hard-coded starting value
  (`useState(0.2)`), progress advanced by a timer or `setInterval` rather than
  by completed steps, or steps counted that the person never performs.
- On screen: progress that moves on its own, or starts partway with no
  finished step shown.

**Notes:** Nunes and Drèze (2006) gave car-wash customers loyalty cards
needing 8 stamps. Of those whose card had 10 spaces with 2 already stamped,
34% finished, against 19% of those with a blank card of 8. They found the
effect stronger when the head start came with a reason. No direct
replication turned up. A meta-analysis of 32 web-survey experiments (Villar, Callegaro,
and Yang, 2013) found that constant-speed progress bars did not reduce
drop-off, and slow-to-fast bars increased it
(https://research.google/pubs/where-am-i-a-meta-analysis-of-experiments-on-the-effects-of-progress-indicators-for-web-surveys/).
yt-2TlIg3VokY8 (1:49) calls this the goal gradient effect, a related but
different finding, and ends (11:18) by saying "even a fake" progress bar
works. Its own description warns against faking progress, and this rule
follows the description.
