import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_template/app.dart';
import 'package:app_template/core/di/providers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Theme Toggle Integration Tests', () {
    testWidgets('uses system theme by default', (tester) async {
      SharedPreferences.setMockInitialValues({'onboarding_completed': true});
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // App should respect system theme
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.themeMode, ThemeMode.system);
    });

    testWidgets('applies light theme when set', (tester) async {
      SharedPreferences.setMockInitialValues({
        'onboarding_completed': true,
        'theme_mode': 'light',
      });
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify light theme is applied
      final context = tester.element(find.byType(MaterialApp));
      final brightness = Theme.of(context).brightness;
      expect(brightness, Brightness.light);
    });

    testWidgets('applies dark theme when set', (tester) async {
      SharedPreferences.setMockInitialValues({
        'onboarding_completed': true,
        'theme_mode': 'dark',
      });
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify dark theme is applied
      final context = tester.element(find.byType(MaterialApp));
      final brightness = Theme.of(context).brightness;
      expect(brightness, Brightness.dark);
    });

    testWidgets('theme toggle persists across app restarts', (tester) async {
      // Simulate user having set dark mode
      SharedPreferences.setMockInitialValues({
        'onboarding_completed': true,
        'theme_mode': 'dark',
      });
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify dark theme is still applied
      final context = tester.element(find.byType(MaterialApp));
      final brightness = Theme.of(context).brightness;
      expect(brightness, Brightness.dark);
    });

    testWidgets('theme colors are correctly applied in dark mode', (
      tester,
    ) async {
      SharedPreferences.setMockInitialValues({
        'onboarding_completed': true,
        'theme_mode': 'dark',
      });
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify dark mode colors
      final context = tester.element(find.byType(MaterialApp));
      final colorScheme = Theme.of(context).colorScheme;

      // Dark mode should have darker surface color
      expect(colorScheme.surface.computeLuminance(), lessThan(0.1));
    });

    testWidgets('theme colors are correctly applied in light mode', (
      tester,
    ) async {
      SharedPreferences.setMockInitialValues({
        'onboarding_completed': true,
        'theme_mode': 'light',
      });

      await tester.pumpWidget(const app.AppTemplate());
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify light mode colors
      final context = tester.element(find.byType(MaterialApp));
      final colorScheme = Theme.of(context).colorScheme;

      // Light mode should have lighter surface color
      expect(colorScheme.surface.computeLuminance(), greaterThan(0.9));
    });
  });
}
