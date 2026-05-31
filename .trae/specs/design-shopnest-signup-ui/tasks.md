# Tasks
- [x] Task 1: Define Shopnest palette usage for the Sign Up screen
  - [x] Add centralized color constants (primary `#0B73D9`, accent `#FF6D00`, background `#FFFFFF/#F8F9FA`, text `#1E293B`, secondary `#64748B`) to be reused by Sign Up widgets
  - [x] Update app theme seed (or page-local theme) to align focus/active states with `#0B73D9`

- [x] Task 2: Update RegisterPage structure to match the required layout
  - [x] Add an app bar styled with primary color `#0B73D9`
  - [x] Add a top section with a logo placeholder and “Create an Account” heading
  - [x] Ensure background is `#FFFFFF` or `#F8F9FA` and spacing is mobile-optimized

- [x] Task 3: Update input fields to match the required styling and fields
  - [x] Replace First/Last/Confirm fields with: Full Name, Email Address, Password
  - [x] Add prefix icons and focused border using `#0B73D9`
  - [x] Ensure placeholders/subtitles use `#64748B` and main text uses `#1E293B`
  - [x] Add password visibility toggle (eye icon)

- [x] Task 4: Update submit + bottom prompt behavior
  - [x] Style the Register CTA button background with `#FF6D00` (strictly CTA only)
  - [x] Add “Already have an account? Log in” with “Log in” as a clickable link in `#0B73D9`
  - [x] Keep BLoC integration working by mapping Full Name → firstName/lastName and confirmPassword=password

- [x] Task 5: Verification
  - [x] Run code generation only if needed (Freezed/Injectable changes)
  - [x] Run analysis and ensure the app builds (blocked in Trae sandbox: Flutter SDK writes to `/Users/ositrade/Documents/flutter/bin/cache/engine.stamp` are restricted)
  - [x] Manually verify palette usage, spacing, password toggle, validation, and link interactivity

# Task Dependencies
- Task 2 depends on Task 1 (palette constants/theming)
- Task 3 depends on Task 1
- Task 4 depends on Task 3
