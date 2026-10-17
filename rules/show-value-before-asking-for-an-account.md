---
title: Show value before asking for an account
summary: Let people see the product work, or try it, before they have to sign up, and ask for the account when it gives them something.
category: onboarding
principle: Lazy registration
confidence: established
sources: [yt-Qsq-Sj_rojU, yt-2TlIg3VokY8]
---

**Do:** Make the first screen show the product doing its job, not a list of
features. Where you can, let people try the core task before they register.
Ask for an account at the moment it gives them something, such as saving or
syncing their work. Label the button with what it does, such as
"Create account to save".

**Don't:** Put a login wall in front of a product people have not seen yet.
Don't blur a result to force sign-up, or let people build something and then
make an account the only way to keep it.

**Why:** People commit once they have felt the value. A wall before that
gives them no reason to keep going.

**Spot it:**

- In code: an auth guard at the root layout that sends signed-out people
  straight to sign-in at launch, such as `if (!session) return <Redirect
  href="/login" />` around every route; results blurred or locked behind
  sign-up; a sign-up button labeled only "Continue".
- On screen: the first launch shows a login wall before any product
  content.

**Notes:** Nielsen Norman Group reports that users were rarely more annoyed
than when a login wall blocked them, and advises a wall only when signing in
clearly benefits the user (https://www.nngroup.com/articles/login-walls/).
Apps that hold personal data, such as banking, are the exception.
yt-Qsq-Sj_rojU (0:47, 1:05) shows welcome screens from Tide and Runna that
demonstrate the outcome, and Duolingo and Alma letting people finish a first
task before the account.

yt-2TlIg3VokY8 (3:52) makes the same case with a partial free report and a
"build your profile first" flow, crediting reciprocity and the IKEA effect.
Baymard's checkout survey found 18–19% of US shoppers had abandoned an
order because the site wanted them to create an account
(https://baymard.com/blog/current-state-of-checkout-ux). The IKEA effect is
real but narrow: in Norton, Mochon, and Ariely (2012) it disappeared when
people failed to finish what they built. The video's "free samples raise
sales up to 2,000%" is an uncontrolled upper bound from a sampling vendor.
