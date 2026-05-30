# Clean Architecture Folder Structure Plan

## Summary
Create a feature-first Clean Architecture folder structure for the `shop_nest` Flutter project, generating empty directories without creating any classes.

## Current State Analysis
The workspace is a newly initialized Flutter application. The `lib/` directory currently only contains `main.dart`. No feature modules or architectural layers exist yet.

## Proposed Changes
We will create a comprehensive Clean Architecture directory structure inside the `lib/` folder. To ensure empty folders are tracked by version control, we will place an empty `.gitkeep` file in the deepest directories.

1. **Create Core Directory**
   - `lib/core/error/`
   - `lib/core/network/`
   - `lib/core/usecases/`
   - `lib/core/utils/`

2. **Create Feature Directories**
   We will create a `lib/features/` folder to house the requested features:
   - `auth`
   - `products`
   - `reviews_and_ratings`
   - `carts`
   - `orders`
   - `payments`

3. **Generate Clean Architecture Layers per Feature**
   For each of the features listed above, we will create the following subdirectories:
   - **`data/`**
     - `datasources/`
     - `models/`
     - `repositories/`
   - **`domain/`**
     - `entities/`
     - `repositories/`
     - `usecases/`
   - **`presentation/`**
     - `pages/`
     - `widgets/`
     - `manager/` (for state management like BLoC, Riverpod, or Provider)

## Assumptions & Decisions
- **Framework**: Identified as a Flutter project based on existing `.dart_tool` and `android/` folders.
- **Empty Folders**: Only empty folders (with `.gitkeep` to preserve them) will be created as requested ("no classes yet").
- **Core Folder**: Added a `core` directory alongside `features` to house shared logic (network, errors, etc.), which is standard in Clean Architecture.
- **Depth**: Used the full standard Clean Architecture depth (datasources, models, entities, etc.) inside `data`, `domain`, and `presentation` to set up a robust foundation for a startup project.

## Verification Steps
- Check the output of the folder creation commands to ensure all paths are created without errors.
- Run a tree/listing command (e.g., `find lib/features -type d`) to verify that all feature directories and their internal layers exist.