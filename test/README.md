# Testing Guide

This document describes the testing infrastructure for the Flutter App Template.

## Test Structure

```
test/
├── helpers/
│   └── test_helpers.dart      # Common test utilities
├── unit/
│   ├── dto/                   # DTO serialization tests
│   ├── repositories/          # Repository logic tests
│   └── utils/                 # Validators & extensions tests
├── widget/
│   └── widget_test.dart       # Widget component tests
└── widget_test.dart           # Root app test

integration_test/
├── app_test.dart              # Test runner
├── auth_flow_test.dart        # Authentication flow tests
├── locale_switching_test.dart # Localization tests
└── theme_toggle_test.dart     # Theme switching tests
```

## Running Tests

### All Tests (Unit + Widget)

```bash
flutter test
```

### Unit Tests Only

```bash
flutter test test/unit/
```

### Widget Tests Only

```bash
flutter test test/widget/
```

### Integration Tests

Integration tests require a running emulator or connected device:

```bash
# Run on default device
flutter test integration_test/

# Run on specific device
flutter test integration_test/ -d <device_id>

# Run specific test file
flutter test integration_test/auth_flow_test.dart
```

### With Coverage

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Test Categories

### Unit Tests

Located in `test/unit/`, these test individual functions and classes in isolation.

| File | Description |
|------|-------------|
| `dto/user_dto_test.dart` | UserDto, AuthTokensDto, LoginRequestDto serialization |
| `dto/post_dto_test.dart` | PostDto, CategoryDto, PostStatus serialization |
| `dto/api_response_test.dart` | ApiResponse, PaginatedResponse, ApiError |
| `repositories/base_repository_test.dart` | Result types, Failure handling |
| `utils/validators_test.dart` | Email, password, phone validation |
| `utils/extensions_test.dart` | String, DateTime, Nullable extensions |

### Widget Tests

Located in `test/widget/`, these test UI components in isolation.

| Component | Tests |
|-----------|-------|
| `AppFilledButton` | Rendering, sizes, icons, loading state, callbacks |
| `AppOutlinedButton` | Rendering, label display |
| `AppTextButton` | Rendering, label display |
| `AppPasswordField` | Label, visibility toggle, error display |
| `AppSearchField` | Hint text, clear button |
| `AppIconContainer` | All sizes, custom colors |
| `AppAvatar` | Initials generation, all sizes |
| `EmptyState` | Message, title, action buttons |
| `CompactEmptyState` | Message, action handling |

### Integration Tests

Located in `integration_test/`, these test complete user flows.

| File | Description |
|------|-------------|
| `auth_flow_test.dart` | Onboarding flow, skip, login navigation, form validation |
| `locale_switching_test.dart` | English/Russian/Uzbek locale switching & persistence |
| `theme_toggle_test.dart` | Light/dark/system theme switching & persistence |

## Test Helpers

### TestApp Widget

Wraps widgets with necessary providers for testing:

```dart
await tester.pumpApp(
  const MyWidget(),
  themeMode: ThemeMode.dark,
  locale: const Locale('ru'),
);
```

### MockSharedPreferences

Pre-configured mock for SharedPreferences:

```dart
final prefs = await setupMockPreferences(values: {
  'onboarding_completed': true,
  'theme_mode': 'dark',
});
```

### WidgetTester Extensions

- `pumpApp()` - Pump widget with TestApp wrapper
- `pumpAppAndSettle()` - Pump and settle with TestApp wrapper

## Writing New Tests

### Unit Test Example

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:app_template/data/dto/my_dto.dart';

void main() {
  group('MyDto', () {
    test('fromJson creates correct instance', () {
      final json = {'id': '1', 'name': 'Test'};
      final dto = MyDto.fromJson(json);
      
      expect(dto.id, '1');
      expect(dto.name, 'Test');
    });

    test('toJson returns correct map', () {
      final dto = MyDto(id: '1', name: 'Test');
      final json = dto.toJson();
      
      expect(json['id'], '1');
      expect(json['name'], 'Test');
    });
  });
}
```

### Widget Test Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_template/presentation/widgets/my_widget.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('MyWidget', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpApp(
        const MyWidget(title: 'Hello'),
      );

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('handles tap', (tester) async {
      var tapped = false;
      
      await tester.pumpApp(
        MyWidget(onTap: () => tapped = true),
      );

      await tester.tap(find.byType(MyWidget));
      expect(tapped, isTrue);
    });
  });
}
```

### Integration Test Example

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_template/app.dart';
import 'package:app_template/core/di/providers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('my integration test', (tester) async {
    SharedPreferences.setMockInitialValues({
      'onboarding_completed': true,
    });
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    // Test user flow...
    await tester.tap(find.text('Button'));
    await tester.pumpAndSettle();
    
    expect(find.text('Result'), findsOneWidget);
  });
}
```

## Best Practices

1. **Group related tests** - Use `group()` to organize tests logically
2. **Use descriptive names** - Test names should describe the expected behavior
3. **One assertion per test** - Keep tests focused on a single behavior
4. **Mock external dependencies** - Use mocktail for mocking
5. **Test edge cases** - Include tests for error states and boundary conditions
6. **Keep tests fast** - Avoid unnecessary delays and heavy operations

## Dependencies

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
  mocktail: ^1.0.4
```
