---
title: Fill in what you already know
summary: Cut typing by deriving or looking up fields, such as finding an address from a postcode, instead of asking for each one.
category: forms
principle: Parkinson's law
confidence: established
sources: [ig-Del7XTgsuwI]
---

**Do:** Ask for the smallest input that identifies the answer, then fill in
the rest. Examples: a postcode lookup that offers matching addresses,
address autocomplete, and fields prefilled from the account or the device.

**Don't:** Make people type out every field of something you could look up or
already have.

**Why:** Every keystroke is effort and a chance for a typo. A form that
takes less input gets finished faster and more often.

**Spot it:**

- In code: address fields (`street`, `city`, `postcode`) with no lookup or
  autocomplete; inputs missing `autoComplete` or `textContentType` (React
  Native) or `autocomplete` (web); name or email fields not prefilled from the
  signed-in user; country or currency not derived from the locale.
- On screen: a form asks for something the app already shows elsewhere.

**Notes:** ig-Del7XTgsuwI (0:49) cuts a full address from 30 keystrokes to 7
with postcode lookup. The video frames this as Parkinson's law, that a task
swells to fill the time it is given, but the rule holds on effort alone. See also
[preselect-the-most-likely-choice](preselect-the-most-likely-choice.md),
which covers best guesses rather than known data.
