# Authentication Feature (Register) Implementation Plan

## Summary
Implement the Register feature for the `shop_nest` app using Clean Architecture, BLoC, Freezed, Dio, and GetIt/Injectable. We will set up the core dependency injection, update the data/domain/presentation layers for auth, and provide a functional, professional UI with validation.

## Current State Analysis
- A basic Flutter app skeleton exists with a Clean Architecture directory structure (`lib/features/auth/...`).
- Basic `Failure` and `UseCase` abstract classes exist.
- Required packages (flutter_bloc, freezed, dio, injectable, etc.) are not yet added to `pubspec.yaml`.
- No DI setup (`get_it` + `injectable`) is present.
- The `AuthRepository` and `AuthEntity` are currently empty placeholders.

## Proposed Changes

### 1. Dependencies Setup
- **File:** `pubspec.yaml`
- **Action:** Add `flutter_bloc`, `freezed_annotation`, `json_annotation`, `dio`, `get_it`, `injectable`, `dartz`, `equatable`, and `pretty_dio_logger` to `dependencies`. Add `build_runner`, `freezed`, `json_serializable`, and `injectable_generator` to `dev_dependencies`.

### 2. Core & DI Configuration
- **Files:** `lib/injection.dart`, `lib/core/network/dio_module.dart`
- **Action:** 
  - Create `injection.dart` to initialize GetIt and configure Injectable.
  - Create `dio_module.dart` to register a configured `Dio` instance with `pretty_dio_logger` and base URL `https://localhost:7240`.
  - Update `lib/core/error/exceptions.dart` and `lib/core/error/failures.dart` to handle specific API errors (including the validation `AUTH_IDENTITY_ERROR`).

### 3. Domain Layer
- **Files:** 
  - `lib/features/auth/domain/entities/register_entity.dart`
  - `lib/features/auth/domain/usecases/register_usecase.dart`
  - `lib/features/auth/domain/repositories/auth_repository.dart`
- **Action:** 
  - Create `RegisterEntity` containing `success`, `message`, and `data` fields.
  - Create `RegisterUseCase` with `RegisterParams` (firstName, lastName, email, password, confirmPassword).
  - Update `AuthRepository` with the `register` method contract.

### 4. Data Layer
- **Files:** 
  - `lib/features/auth/data/models/register_request_model.dart`
  - `lib/features/auth/data/models/register_response_model.dart`
  - `lib/features/auth/data/datasources/auth_remote_data_source.dart`
  - `lib/features/auth/data/repositories/auth_repository_impl.dart`
- **Action:** 
  - Create Request/Response models using Freezed and JSON Serializable.
  - Implement `AuthRemoteDataSource` using Dio to call `POST /api/v1/auth/register`.
  - Implement `AuthRepositoryImpl` mapping exceptions to `Failure` (especially extracting the specific `errorCode` and `message` for validation errors) and returning `Either<Failure, RegisterEntity>`.

### 5. Presentation Layer
- **Files:** 
  - `lib/features/auth/presentation/manager/register_bloc.dart` (along with event/state files)
  - `lib/features/auth/presentation/pages/register_page.dart`
- **Action:** 
  - Create `RegisterBloc` with Freezed states (`Initial`, `Loading`, `Success`, `Failure`) and `RegisterSubmitted` event.
  - Build `RegisterPage` with a clean, professional UI. Include text fields for all 5 parameters, client-side validation, password visibility toggle, and bloc listeners to show snackbars for errors or success.

### 6. Code Generation
- **Action:** Run `dart run build_runner build --delete-conflicting-outputs` to generate `*.freezed.dart`, `*.g.dart`, and `injection.config.dart`.

### 7. App Integration
- **File:** `lib/main.dart`
- **Action:** Initialize GetIt injection before `runApp`. Setup `BlocProvider` for `RegisterBloc` and set `RegisterPage` as the initial route.

## Assumptions & Decisions
- The provided endpoint `https://localhost:7240` will be used exactly as requested (Note: standard Android emulators map `10.0.2.2` to localhost, but we will use the provided URL. A Dio interceptor or config can be easily changed if needed).
- API errors (like `AUTH_IDENTITY_ERROR`) will be caught in the repository, mapped to a `ServerFailure` with the provided backend message, and displayed to the user in the UI.
- Local form validation will ensure fields are not empty and passwords match before triggering the Bloc event.

## Verification Steps
1. Verify `flutter pub get` successfully installs all packages.
2. Verify `build_runner` completes without errors and all generated files are created.
3. Check `lib/main.dart` compiles and the app launches directly into `RegisterPage`.
4. Validate that the UI correctly shows validation errors, loading indicators, and success/failure states.