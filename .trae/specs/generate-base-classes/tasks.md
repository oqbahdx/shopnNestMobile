# Tasks
- [x] Task 1: Generate Core Error Classes: Create foundational `Failure` and `Exception` classes.
  - [x] SubTask 1.1: Create `lib/core/error/failures.dart` with a base `Failure` class and common failures (e.g., `ServerFailure`, `CacheFailure`).
  - [x] SubTask 1.2: Create `lib/core/error/exceptions.dart` with common exceptions (e.g., `ServerException`, `CacheException`).
- [x] Task 2: Generate Core UseCase Interface: Create the base `UseCase` class.
  - [x] SubTask 2.1: Create `lib/core/usecases/usecase.dart` defining the `UseCase` interface and `NoParams` class.
- [x] Task 3: Generate Core Network Abstractions: Create network info interfaces.
  - [x] SubTask 3.1: Create `lib/core/network/network_info.dart` defining the `NetworkInfo` interface.
- [x] Task 4: Generate Feature Boilerplates: Create base entities and repository interfaces for all features.
  - [x] SubTask 4.1: Create base entity and repository for `auth` feature.
  - [x] SubTask 4.2: Create base entity and repository for `products` feature.
  - [x] SubTask 4.3: Create base entity and repository for `reviews_and_ratings` feature.
  - [x] SubTask 4.4: Create base entity and repository for `carts` feature.
  - [x] SubTask 4.5: Create base entity and repository for `orders` feature.
  - [x] SubTask 4.6: Create base entity and repository for `payments` feature.

# Task Dependencies
- Task 4 depends on nothing but is best done after Core abstractions are set.
