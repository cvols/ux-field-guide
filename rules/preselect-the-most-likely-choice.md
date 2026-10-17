---
title: Preselect the most likely choice
summary: When most people pick the same option, start the field on it, but never preselect anything that costs money or gives consent.
category: forms
principle: Default effect
confidence: established
sources: [yt-2TlIg3VokY8]
---

**Do:** Start a field on the most common or most likely answer, such as
tomorrow's date, the usual party size, or a popular time, and label why
("Popular"). Keep every default visible and easy to change.

**Don't:** Preselect anything that costs money, gives consent, shares data,
or signs people up for something. Don't hide defaults where people can't
review them.

**Why:** Most people keep defaults and read them as a recommendation. A good
default saves effort, and a bad one decides for people without their
noticing.

**Spot it:**

- In code: pickers, selects, or segmented controls initialized to empty or
  `null` where one value is far more common, such as quantity, date, or
  country. Also the opposite case: checkboxes for paid extras, marketing
  consent, or data sharing initialized to true (`useState(true)`,
  `defaultChecked`).
- On screen: blank choices that most people answer the same way, or
  pre-ticked consent or paid extras.

**Notes:** A meta-analysis by Jachimowicz et al. (2019) pooled 58 studies
with about 73,000 participants and found a medium default effect (d = 0.68),
with large variation between studies
(https://business.columbia.edu/faculty/research/when-and-why-defaults-influence-decisions-meta-analysis-default-effects).
The EU Consumer Rights Directive (Article 22) bans pre-ticked boxes for
extra payments. yt-2TlIg3VokY8 (0:22) supports this with the jam study,
which is about how many options to show, not defaults, and with "70–90% never
change defaults", which has no source. See also
[fill-in-what-you-already-know](fill-in-what-you-already-know.md), which
covers data you can derive or look up.
