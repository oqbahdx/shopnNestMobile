# Authentication (Register) — Plan

## Summary
Implement a production-ready **Register** flow in the existing Flutter project using **Clean Architecture** with **BLoC**, **Freezed**, **Dio**, **GetIt/Injectable**, and code generation. Deliver data/domain/presentation layers + DI wiring + a professional Register UI with validation, loading, success, and error handling.

## Current State Analysis (Repo Facts)
- Packages are already present in [pubspec.yaml](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/pubspec.yaml): `flutter_bloc`, `freezed(_annotation)`, `json_(annotation|serializable)`, `dio`, `pretty_dio_logger`, `get_it`, `injectable`, `injectable_generator`, `dartz`, `equatable`, `build_runner`.
- Clean-architecture folders exist under `lib/core` and `lib/features/*`.
- Auth feature has partial implementation:
  - Domain: [RegisterEntity](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/domain/entities/register_entity.dart), [AuthRepository](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/domain/repositories/auth_repository.dart), [RegisterUseCase](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/domain/usecases/register_usecase.dart)
  - Data: request/response models (Freezed) and a remote data source using Dio: [auth_remote_data_source.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/data/datasources/auth_remote_data_source.dart)
- Dependency injection entrypoint exists: [injection.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/injection.dart) and a Dio module: [dio_module.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/core/network/dio_module.dart)
- Generated DI file `lib/injection.config.dart` is currently missing (expected output from `build_runner`).
- Presentation layer for Auth is empty (only `.gitkeep` placeholders); [main.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/main.dart) currently shows “Hello World” and does not initialize DI.
- Error layer exists but is minimal: [exceptions.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/core/error/exceptions.dart), [failures.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/core/error/failures.dart). Current response modeling and error mapping are not sufficient for the validation-error payload shape (missing `data` in error response).

## Proposed Changes (Decision-Complete)

### 1) Core: Robust error modeling + mapping contracts
**Modify**
- [exceptions.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/core/error/exceptions.dart)
  - Add distinct exception types for:
    - validation error (include `errorCode` + backend message)
    - network/connection error
    - timeout error
    - server/unexpected error
- [failures.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/core/error/failures.dart)
  - Add `NetworkFailure`, `TimeoutFailure`, `ValidationFailure`, `UnexpectedFailure` (each carries message).

**Why**
- Centralizes error semantics and enables consistent, testable mapping from Dio failures to UI-safe messages.

### 2) Core: Dio configuration for production-like behavior
**Modify**
- [dio_module.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/core/network/dio_module.dart)
  - Keep base URL `https://localhost:7240` and default JSON headers.
  - Add reasonable timeouts (connect/send/receive) to support timeout handling paths.

**Decision**
- Keep `baseUrl` as requested. (Note: emulators/devices typically cannot reach `localhost` as the host machine; this is an environment concern, not an architectural one.)

### 3) Data: Make response parsing compatible with both success + validation error payloads
**Modify**
- [register_response_model.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/data/models/register_response_model.dart)
  - Make `data` nullable (`String?`) and add optional `errorCode` (`String?`) to parse validation error response safely.

**Why**
- Current model requires `data` and will throw during parsing when backend returns `{ success, message, errorCode }` without `data`.

### 4) Data: Improve remote data source error extraction and classification
**Modify**
- [auth_remote_data_source.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/data/datasources/auth_remote_data_source.dart)
  - On success: parse into `RegisterResponseModel` and return.
  - On `DioException`:
    - Map timeout types to `TimeoutException`
    - Map connection errors to `NetworkException`
    - If `response.data` has `{ message, errorCode }`:
      - If `errorCode == "AUTH_IDENTITY_ERROR"` → throw `ValidationException(message, errorCode)`
      - Else → throw `ServerException(message)`
    - Otherwise throw `ServerException` with a safe fallback message.

**Why**
- Ensures backend error messages (especially identity validation string) are reliably surfaced to the user.

### 5) Data: Implement repository implementation and exception→failure mapping
**Add**
- `lib/features/auth/data/repositories/auth_repository_impl.dart`
  - `@LazySingleton(as: AuthRepository)`
  - Uses `AuthRemoteDataSource` + converts `RegisterParams` to `RegisterRequestModel`
  - Maps:
    - `ValidationException` → `ValidationFailure(message)`
    - `TimeoutException` → `TimeoutFailure(message)`
    - `NetworkException` → `NetworkFailure(message)`
    - `ServerException` → `ServerFailure(message)`
    - any other → `UnexpectedFailure(message)`
  - On success, maps response model to [RegisterEntity](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/features/auth/domain/entities/register_entity.dart) and returns `Right(entity)`.

### 6) Presentation: Register BLoC using Freezed events/states
**Add**
- `lib/features/auth/presentation/bloc/register/register_bloc.dart`
- `lib/features/auth/presentation/bloc/register/register_event.dart`
- `lib/features/auth/presentation/bloc/register/register_state.dart`

**Behavior**
- Event: `RegisterSubmitted(firstName, lastName, email, password, confirmPassword)`
- States (Freezed):
  - `RegisterInitial`
  - `RegisterLoading`
  - `RegisterSuccess(RegisterEntity result)`
  - `RegisterFailure(String message)`
- Bloc:
  - emits loading → calls `RegisterUseCase` → emits success/failure based on `Either`.

**DI**
- Annotate bloc with `@injectable` so it can be created by GetIt with `RegisterUseCase`.

### 7) Presentation: Professional Register page with clean widget structure
**Add**
- `lib/features/auth/presentation/pages/register_page.dart`
- `lib/features/auth/presentation/widgets/`:
  - `register_form.dart` (stateful form + controllers + validators + toggles)
  - `auth_text_field.dart` (reusable styled `TextFormField`)

**UI requirements covered**
- Fields: first name, last name, email, password, confirm password
- Form validation:
  - required checks
  - basic email format check
  - password min length (8) and confirm match
- Password visibility toggle for password + confirm password
- Loading state: disable button + show progress indicator
- Error state: show backend message via `SnackBar` (or inline banner) from `RegisterFailure`
- Success state: show backend success `data` message via `SnackBar` and optionally reset the form

### 8) App wiring: initialize DI and show Register page
**Modify**
- [main.dart](file:///Users/ositrade/Desktop/E-Commerce%20Projects/Mobile/shop_nest/lib/main.dart)
  - Call `configureDependencies()` before `runApp`
  - Use `BlocProvider` created from `getIt<RegisterBloc>()`
  - Set `RegisterPage` as the initial screen to validate the feature end-to-end

## Assumptions & Decisions
- Only packages already present in `pubspec.yaml` will be used; no new dependencies (e.g., connectivity plugins) are added.
- Network availability is inferred from Dio connection errors (since there is no network-info implementation in the repo).
- Backend validation errors are displayed exactly as returned in `message` (the semicolon-delimited string).
- Register is treated as a standalone first screen for now; routing integration can be extended later.

## Verification Steps
1. Run code generation:
   - `dart run build_runner build --delete-conflicting-outputs`
2. Confirm `lib/injection.config.dart` and all `*.freezed.dart` / `*.g.dart` files are generated.
3. Run static analysis:
   - `flutter analyze`
4. Run the app and validate UI behavior:
   - form validation blocks invalid submissions
   - loading indicator displays during API call
   - backend error message displays on validation error
   - success message displays on 200 response

