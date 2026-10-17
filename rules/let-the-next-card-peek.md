---
title: Let the next card peek
summary: In a horizontal scroller, show part of the next card so people know there is more to swipe.
category: layout
principle: Law of closure
confidence: established
sources: [ig-Del7XTgsuwI]
---

**Do:** Size cards so the screen edge cuts off the next one, with about a
quarter to a third of it visible.

**Don't:** Fit a whole number of cards exactly to the screen width. A row
that ends cleanly reads as the complete set, so people do not swipe.

**Why:** People complete shapes that are cut off, so a clipped card reads as
part of a row that keeps going.

**Spot it:**

- In code: a horizontal list or carousel (`horizontal`, `pagingEnabled`,
  `snapToInterval`, `scroll-snap-type: x`, `overflow-x: auto`) whose item
  width equals the screen or container width (`Dimensions.get('window').width`,
  `width: '100%'`, `w-full`), or divides it evenly, such as `(width - gap) / 2`.
- On screen: the last visible card in a horizontal row ends exactly at the
  screen edge.

**Notes:** ig-Del7XTgsuwI (0:02) compares 0% and 32% of the next card
visible. The 32% comes from the video's mockup and is not a measured optimum.
