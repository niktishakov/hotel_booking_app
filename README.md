# Hotel Booking App

A Flutter application for hotel bookings with a separate core module.

## Prerequisites

Before you begin, ensure you have the following installed:
- Flutter SDK (>=3.4.0)
- Dart SDK (>=3.4.3)
- [Flutter Version Manager (FVM)](https://fvm.app/) (recommended)

## Project Structure

The application follows a modular architecture with two main components:


```
root/
├── core/ # Pure Dart module for core features
│ └── lib/
│ ├── src/
│ │ ├── data/ # Data layer (API, repositories implementations)
│ │ ├── domain/ # Business logic and entities
│ │ ├── shared/ # Shared utilities
│ │ └── utils/ # Utility functions
│ └── core.dart # Main export file
│
└── mobile/ # Flutter application
└── lib/
├── core/ # App-specific core features
├── navigation/ # Auto Route navigation setup
├── screens/ # UI screens and their models
├── services/ # App services
└── utils/ # App utilities
```


### Technical Stack

#### State Management
- **BLoC Pattern** using `flutter_bloc` and `hydrated_bloc`
  - `OverviewCubit` for hotel listing management
  - `FavouritesBloc` for favorites functionality
  - Persistent state storage with `HydratedBloc`

#### Dependency Injection
- Provider pattern using `provider` package
- Multi-provider setup for global state and services

#### Navigation
- Auto Route (`auto_route`) for type-safe routing
- Custom route observer (`HbRouteObserver`)

#### Data Layer
- REST API communication using `dio`
- Local storage with `hive` and `hive_flutter`
- Secure storage implementation

#### UI/UX
- Custom theme management (`HbThemeProvider`)
- Material Design components
- Custom scroll behavior
- Vibration feedback
- Toast notifications
- SVG support
- Custom WorkSans font family

#### Error Handling
- Zoned error handling
- Custom logger implementation
- Flutter error handling integration

#### Code Generation
- Build Runner setup for:
  - JSON serialization
  - Freezed models
  - Auto Route generation
  - Chopper API client

### Key Features


1. **Scalable State Management**
   - BLoC pattern for predictable state changes
   - Persistent state storage with `HydratedBloc`

2. **Configuration Management**
   - Secure secrets handling
   - API key management

3. **Developer Experience**
- Comprehensive logging system
- Different device screen support with `emulator_service.dart`

### Design Patterns
- Repository Pattern for data access
- BLoC Pattern for state management
- Observer Pattern for navigation
- Factory Pattern for services
- Dependency Injection for loose coupling


## Setup Instructions

1. Clone the repository
```bash
git clone [repository-url]
cd [repository-name]
```

2. Install FVM (if not already installed)
```bash
dart pub global activate fvm
```

3. Install project dependencies
```bash
# Install core module dependencies
cd core
dart pub get

# Install mobile app dependencies
cd ../mobile
flutter pub get
```

4. Generate necessary files
```bash
# Generate files for core module
cd core
dart run build_runner watch --delete-conflicting-outputs

# Generate files for mobile app
cd ../mobile
dart run build_runner watch --delete-conflicting-outputs
```

## Running the App

```bash
cd mobile
fvm flutter run -t lib/main.dart
```
OR
```bash
cd mobile
rps run
```

## Building for IPA

```bash
cd mobile
rps build
```

## Available Scripts

### Mobile App
```bash
# Generate code
dart run build_runner watch

# Run app in development
flutter run -t lib/main.dart
```

## Assets

The project includes:
- Images: `assets/images/`
- SVG files: `assets/svgs/`
- Custom fonts: WorkSans
- Configuration: `secrets.json`

## Dependencies

### Mobile App Key Dependencies
- Flutter Bloc for state management
- Auto Route for navigation
- Dio for HTTP requests
- HydratedBloc for persistent state
- Flutter SVG for SVG support
- Various UI enhancement packages

### Core Module Key Dependencies
- Dio for networking
- Hive for local storage


## Additional Notes

- The app uses WorkSans as its primary font family
- Supports both iOS and Android platforms
- Includes launcher icons configuration

