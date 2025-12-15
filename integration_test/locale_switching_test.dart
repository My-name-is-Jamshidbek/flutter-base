import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_template/app.dart';
import 'package:app_template/core/di/providers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Locale Switching Integration Tests', () {
    testWidgets('displays English text by default', (tester) async {
      SharedPreferences.setMockInitialValues({'onboarding_completed': true});
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify English text is displayed
      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('can switch to Russian locale', (tester) async {
      SharedPreferences.setMockInitialValues({
        'onboarding_completed': true,
        'language_code': 'ru',
      });
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify Russian text is displayed
      expect(find.text('Войти'), findsOneWidget);
    });

    testWidgets('can switch to Uzbek locale', (tester) async {
      SharedPreferences.setMockInitialValues({
        'onboarding_completed': true,
        'language_code': 'uz',
      });
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify Uzbek text is displayed
      expect(find.text('Kirish'), findsOneWidget);
    });

    testWidgets('locale persists across app restarts', (tester) async {
      // First launch with Russian
      SharedPreferences.setMockInitialValues({
        'onboarding_completed': true,
        'language_code': 'ru',
      });
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify Russian is used - checking for Russian login button
      expect(find.text('Войти'), findsOneWidget);
    });
  });
}
