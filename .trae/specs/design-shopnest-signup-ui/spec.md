# Shopnest Sign Up UI Spec

## Why
The current registration screen is functional but does not match the “Shopnest” brand and does not meet the required modern, trustworthy e-commerce UI polish.

## What Changes
- Update the Register (Sign Up) UI to follow the provided Shopnest color palette and typography rules.
- Adjust the form layout to the specified fields and sections (logo + heading, inputs, CTA, bottom login prompt).
- Ensure the “Register” CTA uses **only** the specified accent color and remains visually dominant.
- Keep the existing Register API integration and BLoC flow working.

## Impact
- Affected specs: Auth → Registration UI/UX, Theming
- Affected code:
  - `lib/features/auth/presentation/pages/register_page.dart`
  - `lib/features/auth/presentation/widgets/register_form.dart`
  - `lib/features/auth/presentation/widgets/auth_text_field.dart`
  - `lib/main.dart` (theme seed / palette alignment)

## ADDED Requirements

### Requirement: Shopnest Color Palette
The system SHALL render the Sign Up page using the following palette:
- Primary brand: `#0B73D9` used for app bar, focused/active states, prefix icons inside fields, and text links.
- Accent/CTA: `#FF6D00` used **strictly** for the main “Register/Create Account” button background.
- Background: `#FFFFFF` or `#F8F9FA`.
- Typography: main text `#1E293B`, secondary/placeholder `#64748B`.

#### Scenario: Palette compliance
- **WHEN** the user views the Sign Up page
- **THEN** the app bar is primary brand color (`#0B73D9`)
- **AND** input field prefix icons and focused border use `#0B73D9`
- **AND** the main CTA button background uses `#FF6D00` and no other control uses that color as a background fill
- **AND** headings/body text use `#1E293B` and secondary text/placeholder uses `#64748B`

### Requirement: Mobile-Optimized Layout
The system SHALL provide a clean mobile-first layout with breathable spacing and a professional, secure feel.

#### Scenario: Layout sections
- **WHEN** the user opens the Sign Up page
- **THEN** they see a top section containing:
  - a logo placeholder for “Shopnest”
  - a heading “Create an Account”
- **AND** they see input fields with subtle borders for:
  - Full Name
  - Email Address
  - Password (with eye icon toggle)
- **AND** they see a large “Register” CTA button
- **AND** they see a bottom prompt “Already have an account? Log in” where “Log in” is a clickable link in `#0B73D9`

### Requirement: Registration Field Mapping (UI → Existing Register API)
The system SHALL keep the existing registration BLoC/usecase/API contract working while collecting the UI fields defined in this spec.

#### Scenario: Submitting with Full Name + Email + Password
- **WHEN** the user submits the form with Full Name, Email Address, and Password
- **THEN** the system derives:
  - `firstName` from the first token in Full Name
  - `lastName` from the remaining tokens (joined with spaces)
  - `confirmPassword` = `password`
- **AND** it dispatches the existing register event/usecase call with those derived values

#### Scenario: Full Name validation
- **WHEN** the user enters a Full Name that cannot be split into at least 2 tokens
- **THEN** the form shows a validation error prompting the user to enter first and last name

## MODIFIED Requirements

### Requirement: Register Form Fields
The existing Register form SHALL be updated from the current “First Name / Last Name / Email / Password / Confirm Password” UI to the spec UI fields:
- Full Name
- Email Address
- Password

## REMOVED Requirements

### Requirement: Confirm Password Field in UI
**Reason**: The requested UI explicitly defines only Full Name, Email Address, and Password.
**Migration**: The system sets `confirmPassword = password` when dispatching registration, keeping backend compatibility without a visible confirm field.

