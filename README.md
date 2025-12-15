# Flutter App Template

A production-ready Flutter application template featuring clean architecture, Material Design 3, multi-language support, and comprehensive testing.

## ✨ Features

- **Clean Architecture** - Layered separation (data, domain, presentation)
- **Material Design 3** - Modern theming with dynamic color support
- **Multi-Language Support** - English, Russian, Uzbek (easily extensible)
- **State Management** - Riverpod with code generation
- **Navigation** - GoRouter with typed routes and guards
- **Authentication Flow** - Complete onboarding and login implementation
- **Theme Modes** - Light, dark, and system theme support
- **Comprehensive Testing** - Unit, widget, and integration tests
- **Functional Programming** - fpdart for Result types and error handling

## 🚀 Getting Started

### Prerequisites

- Flutter SDK ^3.9.2
- Dart SDK ^3.9.2

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd flutter-base

# Install dependencies
flutter pub get

# Run code generation
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

## 📁 Project Structure

```
lib/
├── main.dart                 # Entry point
├── app.dart                  # Root app widget with MaterialApp.router
├── core/
│   ├── config/               # App configuration
│   ├── di/                   # Dependency injection (Riverpod providers)
│   ├── env/                  # Environment configuration
│   ├── logging/              # Logging utilities
│   └── utils/                # Extensions, validators, helpers
├── data/
│   ├── api/                  # API clients and interceptors
│   ├── dto/                  # Data Transfer Objects (with Freezed)
│   └── repositories/         # Repository implementations
├── domain/
│   ├── entities/             # Business entities
│   └── usecases/             # Business logic use cases
├── l10n/
│   └── gen/                  # Generated localization files
└── presentation/
    ├── features/             # Feature modules (onboarding, auth, home)
    ├── router/               # GoRouter configuration and guards
    ├── theme/                # Theme configuration (colors, typography)
    └── widgets/              # Reusable UI components
```

## 🏗️ Architecture

### Layers

| Layer | Responsibility |
|-------|---------------|
| **Presentation** | UI components, state management, navigation |
| **Domain** | Business entities, use cases, repository interfaces |
| **Data** | API clients, DTOs, repository implementations |
| **Core** | Shared utilities, DI, configuration |

### State Management

Uses **Riverpod** with the Notifier pattern and code generation:

```dart
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => const AuthState.initial();
  
  Future<void> login(String email, String password) async {
    // Implementation
  }
}
```

### Navigation

**GoRouter** with typed routes and guards:

```dart
// Navigate with type-safe routes
context.go(HomeRoute().location);

// Route guards
class AuthGuard extends RouteGuard {
  @override
  String? redirect(BuildContext context, GoRouterState state) {
    if (!isAuthenticated) return '/login';
    return null;
  }
}
```

## 🎨 Theming

### Theme Modes

```dart
// Access current theme
final themeMode = ref.watch(themeModeProvider);

// Toggle theme
ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.dark);
```

### Custom Components

- `AppButton` - Primary, secondary, text button variants
- `AppTextField` - Styled text input with validation
- `AppAvatar` - User avatar with initials fallback
- `AppCard` - Consistent card styling
- `AppEmptyState` - Empty state placeholder
- `AppIcon` - Themed icon component

## 🌍 Localization

### Supported Languages

| Code | Language |
|------|----------|
| `en` | English |
| `ru` | Russian |
| `uz` | Uzbek |

### Usage

```dart
// Access translations
Text(context.l10n.welcomeMessage)

// Switch locale
ref.read(localeProvider.notifier).setLocale(const Locale('ru'));
```

### Adding Translations

1. Add strings to `lib/l10n/app_en.arb`, `app_ru.arb`, `app_uz.arb`
2. Run code generation: `flutter gen-l10n`

## 🧪 Testing

### Test Structure

```
test/
├── helpers/           # Test utilities and mocks
├── unit/              # Unit tests
│   ├── dto/           # DTO serialization tests
│   ├── repositories/  # Repository tests
│   └── utils/         # Utility tests
├── widget/            # Widget tests
└── widget_test.dart   # Root app test

integration_test/
├── auth_flow_test.dart        # Authentication flow
├── locale_switching_test.dart # Locale switching
└── theme_toggle_test.dart     # Theme toggling
```

### Running Tests

```bash
# Run all unit and widget tests
flutter test

# Run with coverage
flutter test --coverage

# Run integration tests (requires device/emulator)
flutter test integration_test/
```

For detailed testing documentation, see [test/README.md](test/README.md).

## ⚙️ Environment Configuration

Environment-specific configuration is managed via the `core/env/` directory:

```dart
// Access environment config
final apiUrl = Environment.apiBaseUrl;
final isProduction = Environment.isProduction;
```

## 🔧 Code Generation

This project uses code generation for:

- **Freezed** - Immutable data classes and unions
- **Riverpod Generator** - Type-safe providers
- **JSON Serializable** - JSON serialization
- **GoRouter Builder** - Typed routes

```bash
# One-time build
dart run build_runner build --delete-conflicting-outputs

# Watch mode (for development)
dart run build_runner watch --delete-conflicting-outputs
```

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| flutter_riverpod | ^2.6.1 | State management |
| go_router | ^14.6.2 | Navigation |
| dio | ^5.7.0 | HTTP client |
| shared_preferences | ^2.3.4 | Local storage |
| freezed | ^2.5.7 | Immutable models |
| fpdart | ^1.1.0 | Functional programming |
| mocktail | ^1.0.4 | Mocking for tests |

## 📝 Scripts

```bash
# Run the app
flutter run

# Build APK
flutter build apk

# Build iOS
flutter build ios

# Analyze code
flutter analyze

# Format code
dart format lib test

# Run all tests
flutter test

# Generate localization
flutter gen-l10n

# Clean project
flutter clean && flutter pub get
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
