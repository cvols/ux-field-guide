---
name: ux-audit
description: Audit an existing app's UI against the user's ux-field-guide rules, in code and on screen, and write a report of what breaks and what passes. Use for "/ux-audit", "/ux-audit <path or area>", "audit this repo's UX", or "check this app against my UX rules". For a single screen or a diff, use ux-review instead.
---

# UX audit

Checks an app that already exists against every rule in the
`cvols/ux-field-guide` repo. It reads the code, looks at the running app,
and writes a report. It does not change the audited repo.

Find the guide's root with
`git -C <this skill's directory> rev-parse --show-toplevel`. "The project"
below means the repo being audited.

## Ground rules

- The project's own docs win. Read its `AGENTS.md`, `CLAUDE.md`, and any UI
  or design standards first. Where the project deliberately does something a
  rule forbids, report it as a conflict, not a finding.
- Read only. Do not edit, commit, or reformat anything in the project. If a
  dev server or simulator is already running, reuse it rather than starting
  a second one.
- Keep the project private. Do not copy its code or screenshots into the
  guide repo, which is public. A lesson from an audit goes back into the
  guide only as a general rule.

## Steps

1. **Scope.** With an argument, audit that path or area. Without one, audit
   every app in the project that has a UI. Name the platforms, such as React
   Native or web, and the frameworks.
2. **Load the rules.** Read the guide's `INDEX.md`, then every rule file. Each
   rule's **Spot it** section lists code signals and what a break looks like
   on screen.
3. **Inventory the surfaces.** Search the project for each rule's code
   signals and list the places that need checking: screens, dialogs, forms,
   lists, onboarding, permission requests, pricing. For each, note the file
   and the rules that apply. Most rules will apply to only a few surfaces.
   In a large project, give each app or area to its own read-only subagent,
   along with the rule files, and merge their lists.
4. **Check the code.** Read each surface and decide, for each rule that
   applies, whether it passes, breaks, or can only be judged on screen. A
   search hit is a lead, not a finding. Read enough of the surrounding code
   to be sure, such as the parent that might supply a backdrop, or the
   handler that might request a permission later.
5. **Check the screen.** Run the app the way the project says to (its
   README, a `run` skill, or its scripts). Use whatever the harness offers to
   capture screens: T3's device or browser preview tools, `control-ui`,
   `xcrun simctl io booted screenshot`, or Playwright. Screenshot each
   surface whose verdict depends on how it looks, plus the first-launch path.
   If the app cannot run, say why and mark those rules "not checked on
   screen". Never guess what a screen looks like.
6. **Write the report** to `~/.agents/work/<project>/ux-audit-<YYYY-MM-DD>/report.md`,
   with screenshots beside it. Use the format below.
7. **Hand off.** Summarize the top findings in chat and offer to fix the ones
   the user picks. Fixes follow the project's own build, test, and PR rules.

## Report

```md
# UX audit: <project> (<scope>), <date>

Rules: <n> from ux-field-guide at <commit>. Surfaces checked: <n>.
On screen: <device or browser>, or "not run: <reason>".

## Findings

Breaks of `established` rules, most serious first.

| Rule | Where | Evidence | Fix |
| --- | --- | --- | --- |
| [slug](<guide URL>/rules/<slug>.md) | `path/file.tsx:42`, Settings screen | what the code or screenshot shows | the smallest change that follows the rule |

## Suggestions

Breaks of `single-source` rules. Same columns.

## Trade-offs

Places a `disputed` rule touches. Say what the rule suggests and what the
evidence against it is. These are never findings.

## Conflicts with project standards

Where the project's own docs choose differently from a rule.

## Passes

Rules that apply and are followed, one line each with where.

## Not checked

Rules that apply but could not be judged, and why.
```

Severity within Findings: first anything that blocks a task or misleads
people (consent, money, permissions, lost data), then friction on a main
path (sign-up, onboarding, core task), then polish.
