# Auth Improvements Plan (Toast + Password Strength)

## Summary
Implement two improvements in the Auth registration UI:
- Replace all `SnackBar` usage with **toast notifications** using `fluttertoast`, via a reusable, DI-registered `ToastService`.
- Add a **reactive password strength checklist** under the password field, fully driven by **RegisterBloc** events/states using **Freezed**, with **no `setState` anywhere** in the auth UI.

## Current State Analysis (Repo Facts)
- Register UI currently shows messages via `SnackBar` inside [register_form.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/widgets/register_form.dart#L100-L207).
- `setState` is used in RegisterForm for password visibility and reset logic (not allowed by the new requirement): [register_form.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/widgets/register_form.dart#L90-L155).
- RegisterBloc is Freezed-based and currently supports only `submitted` event and 4 union states (initial/loading/success/failure):  
  - [register_bloc.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/bloc/register/register_bloc.dart)  
  - [register_event.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/bloc/register/register_event.dart)  
  - [register_state.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/bloc/register/register_state.dart)
- No toast service exists in `core/` (no matching file found by search).
- `fluttertoast` is **not** currently in [pubspec.yaml](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/pubspec.yaml).
- DI is already set up with GetIt/Injectable and codegen via `injection.config.dart`:  
  - [injection.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/injection.dart)  
  - [injection.config.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/injection.config.dart)

## Proposed Changes (Decision-Complete)

### 1) Add `fluttertoast` dependency
**Modify**
- [pubspec.yaml](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/pubspec.yaml)

**Change**
- Add `fluttertoast` to `dependencies`.

### 2) Create a centralized toast service (Core)
**Add**
- `lib/core/services/toast/toast_service.dart` (abstract contract)
- `lib/core/services/toast/fluttertoast_service.dart` (implementation)

**API (example)**
- `showSuccess(String message)`
- `showError(String message)`
- `showInfo(String message)`

**Implementation details**
- Use `fluttertoast` as the only package dependency, but hide it behind the service to keep the UI clean and testable.
- Register service with Injectable (`@LazySingleton(as: ToastService)`).

### 3) Replace SnackBars with ToastService (Auth)
**Modify**
- [register_form.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/widgets/register_form.dart)

**Change**
- Replace all `ScaffoldMessenger.of(context).showSnackBar(...)` with `ToastService` calls.
- Success → toast success with backend message.
- Failure (validation/api/network/timeout) → toast error with the mapped message coming from bloc state.
- “Log in tapped” → use a toast (or remove the placeholder action if desired; default is toast).

**Clean Architecture boundary**
- UI layer depends only on a `ToastService` abstraction located in `core/`, injected via GetIt (no direct `fluttertoast` calls in widgets).

### 4) Remove all `setState` from Auth UI (password visibility + reset)
**Modify**
- [register_form.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/widgets/register_form.dart)
- [register_bloc.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/bloc/register/register_bloc.dart)
- [register_event.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/bloc/register/register_event.dart)
- [register_state.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/bloc/register/register_state.dart)

**Bloc additions**
- Event:
  - `PasswordChanged(String password)` (required)
- Additional event (required to remove `setState` and keep the eye icon):
  - `PasswordVisibilityToggled()`

**State additions (required)**
- `hasMinLength`
- `hasUppercase`
- `hasLowercase`
- `hasNumber`
- `hasSpecialCharacter`
- `isPasswordStrong`

**Additional state field (required to remove `setState`)**
- `isPasswordObscured`

**State modeling decision**
- Keep the existing Freezed union states (`initial/loading/success/failure`) but add the above fields to every variant with defaults, so password UI stays reactive regardless of status.

### 5) Implement reactive password strength logic in Bloc
**Modify**
- [register_bloc.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/bloc/register/register_bloc.dart)

**Logic**
- On `PasswordChanged(password)`:
  - compute each rule using regex checks:
    - min length ≥ 8
    - uppercase `[A-Z]`
    - lowercase `[a-z]`
    - number `[0-9]`
    - special `[^A-Za-z0-9]`
  - set `isPasswordStrong = all true`
  - emit a state update that only changes these booleans (status stays same).
- On `PasswordVisibilityToggled`:
  - flip `isPasswordObscured`

### 6) Add password rules UI widget (Presentation)
**Add**
- `lib/features/auth/presentation/widgets/password_rules_checklist.dart`

**Widget behavior**
- Receives the rule booleans from state and renders a checklist (✓/✗ + label).
- Uses `const` where possible.

**Performance**
- In RegisterForm, render it using `BlocBuilder` or `BlocSelector` with `buildWhen`/selector to rebuild **only** this section on password-related state changes.

### 7) Wire password updates from the TextFormField without `setState`
**Modify**
- [auth_text_field.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/widgets/auth_text_field.dart)
- [register_form.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/presentation/widgets/register_form.dart)

**Change**
- Add optional `onChanged` callback support to `AuthTextField` so password typing can dispatch `PasswordChanged`.
- Password field:
  - `onChanged: (value) => bloc.add(PasswordChanged(value))`
  - `obscureText` bound to `state.isPasswordObscured`
  - Eye icon dispatches `PasswordVisibilityToggled`

### 8) Dependency injection + code generation
**Modify**
- Injectable registration will be picked up by codegen.

**Run**
- `flutter pub get`
- `dart run build_runner build --delete-conflicting-outputs` (or equivalent supported flags in your environment)

## Assumptions & Decisions
- Toast package: **fluttertoast** (confirmed).
- “Validation errors using toast” will mean:
  - Backend/Bloc failures → toast
  - Client-side invalid submit → show a toast describing the first failing rule/field while still allowing field-level error text via validators (to keep usability high).
- No new screens/routes are introduced; only Register UI + bloc + core toast service are updated.

## Verification Steps
1. Confirm no `SnackBar` usage remains under `lib/features/auth/`.
2. Confirm no `setState` remains under `lib/features/auth/`.
3. Confirm password checklist updates live while typing and `isPasswordStrong` toggles appropriately.
4. Confirm password visibility toggle works via bloc state.
5. Confirm all success/failure messages are displayed via toast (API success, validation errors, network/timeout errors).
6. Run code generation and ensure DI compiles (`injection.config.dart` updated).
7. Run `flutter analyze` locally (if sandbox blocks Flutter SDK writes, verify on your machine).

