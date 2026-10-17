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
  rule forbids, report it as a conflict, not a finding. If there are none,
  say "no UI standards found" in the report.
- Read only. Do not edit, commit, or reformat anything in the project.
- Don't take over another session's tools. Other agents may be working in
  the project's worktrees. If a dev server or simulator is already running,
  find out what it serves before using it. Reuse it only if it runs the code
  you are auditing. Never reinstall or reset an app on a simulator another
  session is using; if you can't get your own, skip the screen check and
  say why.
- Keep the project private. Do not copy its code or screenshots into the
  guide repo, which is public. A lesson from an audit goes back into the
  guide only as a general rule.

## Steps

1. **Scope.** With an argument, audit that path or area. Without one, audit
   every app in the project that has a UI. Name the platforms, such as React
   Native or web, and the frameworks. Check the project's plans and active
   branches for code that is about to be replaced. If the target is being
   replaced, tell the user before going further, and frame findings as
   lessons for the new code.
2. **Load the rules.** Read the guide's `INDEX.md`, then every rule file. Each
   rule's **Spot it** section lists code signals and what a break looks like
   on screen.
3. **Inventory the surfaces.** List the places that need checking: screens,
   dialogs, forms, lists, onboarding, permission requests, pricing. For each,
   note the file and the rules that apply.
   - If the UI is under about 50 files, read all of it. That beats searching.
   - In a bigger UI, find surfaces with each rule's code signals. Search
     tracked files only (`git grep`), or limit the search to UI source
     folders, so worktrees, build output, and `node_modules` don't multiply
     the hits.
   - In a large project, give each app or area to its own read-only
     subagent, along with the rule files, and merge their lists.
   - Audit only surfaces people can reach. Judge stubs that ship, such as an
     `alert()` placeholder or a "coming soon" tab, by how they behave. List
     unreachable code separately.
4. **Check the code.** For each surface and each rule that applies, give one
   verdict:
   - **break**: the code breaks the rule.
   - **pass**: the code follows it.
   - **watch**: it passes today, but a likely next change would break it,
     such as a TODO to add a login wall.
   - **screen**: only a screenshot can decide it.
   - **n/a**: the code matched a signal, but the rule doesn't apply. Give the
     reason.

   A search hit is a lead, not a finding. Read enough of the surrounding code
   to be sure, such as the parent that might supply a backdrop, or the
   handler that might request a permission later.
5. **Check the screen.** Run the app the way the project says to (its
   README, a `run` skill, or its scripts). Use whatever the harness offers to
   capture screens: T3's device or browser preview tools, `control-ui`,
   `xcrun simctl io <device> screenshot`, or Playwright. Screenshot every
   **screen** verdict, plus the first launch. For a true first launch,
   reinstall the app or run `xcrun simctl privacy <device> reset all
   <bundle id>` so one-time permission prompts show again. Do that only on a
   simulator nobody else is using. If the app cannot run, say why and leave
   those verdicts as "not checked". Never guess what a screen looks like.
6. **Write the report** to
   `~/.agents/work/<project>/ux-audit-<YYYY-MM-DD>/report.md`, with
   screenshots beside it. Use the format below.
7. **Hand off.** Summarize the top findings in chat and offer to fix the ones
   the user picks. Fixes follow the project's own build, test, and PR rules.

## Report

```md
# UX audit: <project> (<scope>), <date>

Rules: <n> from ux-field-guide at <commit>. Project at <commit>.
Surfaces checked: <n>.
On screen: <device or browser>, or "not run: <reason>".
UI standards: <files read>, or "none found".

## Findings

Breaks of `established` rules, most serious first.

| Rule | Where | Evidence | Fix |
| --- | --- | --- | --- |
| [slug](https://github.com/cvols/ux-field-guide/blob/main/rules/<slug>.md) | `path/file.tsx:42`, Settings screen | what the code or screenshot shows | the smallest change that follows the rule |

## Suggestions

Breaks of `single-source` rules. Same columns.

## Watch

Passes today that a likely next change would break. Rule, where, and risk.

## Trade-offs

Places a `disputed` rule touches. Say what the rule suggests and what the
evidence against it is. These are never findings.

## Conflicts with project standards

Where the project's own docs choose differently from a rule.

## Passes

Rules that apply and are followed, one line each with where.

## Not checked

Verdicts left at "screen" because the app could not run, and rules with no
surface in this app.

## Outside the guide

Other UX, accessibility, or privacy problems found along the way, one line
each. Keep this short. These are leads, not checked findings.
```

Severity within Findings: first anything that blocks a task or misleads
people (consent, money, permissions, lost data), then friction on a main
path (sign-up, onboarding, core task), then polish.
