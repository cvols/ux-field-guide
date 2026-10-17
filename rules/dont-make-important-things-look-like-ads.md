---
title: Don't make important things look like ads
summary: Present warnings and key messages inline with the content they concern, not as bright banners people have learned to skip.
category: hierarchy
principle: Banner blindness
confidence: established
sources: [ig-Del7XTgsuwI]
---

**Do:** Put an important message where people are already reading, styled
like the surrounding content, with a clear label and an action. For example,
an expiring card shown as a row in the account feed.

**Don't:** Announce it with a bright, boxed banner at the top of the screen
or in a sidebar. That is where ads live, and people's eyes jump past it.

**Why:** People learn to ignore anything that looks like an ad: bright
boxes, banners, and content at the edges of the page.

**Spot it:**

- In code: account or safety messages (payment failed, card expiring, verify
  email, data loss) shown only as a banner above the main content or in a
  sidebar with a saturated background: on the web `bg-yellow-*`, `bg-red-*`,
  or a `Banner` component; in React Native a red or yellow `backgroundColor`
  on a container pinned to the top, a toast or snackbar library, or
  `Alert.alert`. Status chips and badges inside content are not messages and
  pass.
- On screen: an important message sits in a bright boxed strip at the top or
  edge, away from the content it concerns.

**Notes:** Banner blindness was first reported by Benway and Lane in 1998,
and Nielsen Norman Group eye-tracking studies keep confirming it. Those
studies also found text ads read more often than display ads, which fits the
advice to style the message like content. ig-Del7XTgsuwI (0:33) shows 0 vs 2
looks, but those counts come from the video's mockup.
