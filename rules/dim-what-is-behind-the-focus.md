---
title: Dim what is behind the focus
summary: Put a dimming backdrop behind dialogs and sheets so the page behind stops competing for attention.
category: hierarchy
principle: Figure-ground
confidence: established
sources: [ig-Del7XTgsuwI]
---

**Do:** Show a scrim behind a modal dialog or sheet that drops the contrast
of the page behind it, so the dialog is the only thing at full contrast.

**Don't:** Float a dialog over a page that keeps full contrast. The page
fights the dialog for attention, and people lose track of what is modal.

**Why:** People split every screen into a figure in front and a ground
behind. Lowering the ground's contrast leaves one thing to look at.

**Spot it:**

- In code: a React Native `<Modal transparent>` whose root view has no
  semi-transparent background, a bottom sheet with no backdrop component, a
  web `<dialog>` with no `::backdrop` style, or a custom overlay with
  `position: fixed` and no scrim layer.
- On screen: with a dialog or sheet open, the page behind it is at full
  contrast.

**Notes:** ig-Del7XTgsuwI (0:16) dims the page from 17.4:1 to 2.5:1 contrast.
Those numbers come from the video's mockup, not a guideline.
