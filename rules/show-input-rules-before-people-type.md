---
title: Show input rules before people type
summary: List a field's format or requirements, such as password rules, next to the field before input, not in an error after submit.
category: forms
principle: none
confidence: established
sources: [yt-Qsq-Sj_rojU]
---

**Do:** Show a field's rules beside it from the start: password
requirements, allowed characters, date format. For passwords, tick each
requirement off as people type.

**Don't:** Reveal the rules only in an error message after people submit.

**Why:** Hidden rules turn into failed submits and retyping.

**Spot it:**

- In code: password or constrained inputs (`secureTextEntry`,
  `type="password"`, a regex check, `minLength`, `pattern`) whose
  requirements appear only in validation error messages, not in helper text
  rendered before submit.
- On screen: requirements appear only after a failed submit.

**Notes:** WCAG 2.2 success criterion 3.3.2 (Labels or Instructions)
requires instructions when input must follow a format. Its examples are a
date field with the expected format, and a username field with strict
character rules
(https://www.w3.org/WAI/WCAG22/Understanding/labels-or-instructions.html).
Ticking requirements off live goes beyond what WCAG asks. yt-Qsq-Sj_rojU
(7:10) shows a live password checklist as an example, with no data.
