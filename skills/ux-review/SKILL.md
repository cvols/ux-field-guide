---
name: ux-review
description: Apply the user's own UX rules from the ux-field-guide repo when designing, building, or reviewing a UI. Use for "/ux-review", "check this against my UX rules", or when building a screen, flow, form, or component and the user wants it to follow their UX guide.
---

# UX review

Applies the rules in the `cvols/ux-field-guide` repo to a UI you are building
or reviewing. Find the repo root with
`git -C <this skill's directory> rev-parse --show-toplevel`.

## Steps

1. Read `INDEX.md` in the repo root. It lists every rule by category with a
   one-line summary.
2. Pick the rules that apply to the UI in front of you: a form pulls in
   `forms` and `feedback`, a list or carousel pulls in `layout` and `choice`,
   and so on. Read each picked rule in full. Skip the rest.
3. Apply them:
   - **Building:** follow the Do lines, avoid the Don't lines. When you make
     a choice because of a rule, name the rule in your summary.
   - **Reviewing:** list each place the UI breaks a rule, with the file and
     line or the screen and element, the rule's slug, and the fix.
4. Weigh by confidence. An `established` rule is a finding. A
   `single-source` rule is a suggestion. A `disputed` rule is a trade-off
   to mention, never a finding.

The repo's rules are not exhaustive. Accessibility basics, platform
conventions, and the project's own design system still apply when no rule
covers them, and the project's design system wins a conflict.

If a review turns up a lesson worth keeping, suggest adding it with
`ux-ingest` or by hand. Do not edit the repo during a review.
