---
title: Ask for permissions when they are needed
summary: Request access to location, notifications, camera, and similar only when people reach the feature that needs it, and say what they gain first.
category: onboarding
principle: none
confidence: established
sources: [yt-Qsq-Sj_rojU]
---

**Do:** Wait until people start the feature that needs the permission. Just
before the system prompt, show what they get from allowing it, such as a
sample notification. If they decline, offer another way to do the task, such
as typing an address instead of sharing location.

**Don't:** Fire permission prompts on first launch with no context. Don't
build a custom screen that imitates the system alert, or ask for access the
feature does not need.

**Why:** On iOS the system prompt shows only once. A request that comes with
a visible reason is more likely to be allowed, and a refused one is hard to
recover from.

**Spot it:**

- In code: permission requests called at app start, from a root layout,
  `App.tsx`, or a `useEffect` on the first screen, instead of in the handler
  of the feature that needs them. Covers `request*PermissionsAsync`
  (notifications, location, camera, contacts, media),
  `getExpoPushTokenAsync` and `registerForPushNotificationsAsync` helpers,
  which ask without saying so, `requestTrackingPermissionsAsync` (App
  Tracking Transparency), SDKs that ask on init (Firebase Messaging
  `requestPermission`, OneSignal), and on the web
  `Notification.requestPermission`, `getUserMedia`, and
  `navigator.geolocation`. Config is a lead, not a break: expo-notifications
  or expo-location plugins and `NS*UsageDescription` keys in `infoPlist`
  show what will be asked. Also look for no fallback when permission is
  denied.
- On screen: a system permission alert appears on first launch, before the
  person has done anything.

**Notes:** Apple's App Review Guideline 5.1.1(iv) bars apps from
manipulating, tricking, or forcing people to consent to unnecessary data
access, and asks for alternatives when people decline
(https://developer.apple.com/app-store/review/guidelines/). One developer
reports a rejection under that guideline for a "Not now" button on a screen
shown before the system prompt (https://developer.apple.com/forums/thread/817672).
That conflicts with common advice to add "Not now" so the one-time prompt is
saved for later. It is unconfirmed in Apple's published text, so check it
before you ship. yt-Qsq-Sj_rojU (7:54) says this timing "improves accept
rates significantly" but cites nothing.
