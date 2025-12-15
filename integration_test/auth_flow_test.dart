import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_template/app.dart';
import 'package:app_template/core/di/providers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Auth Flow Integration Tests', () {
    testWidgets('shows onboarding on first launch', (tester) async {
      // Setup fresh state
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Should show onboarding screen
      expect(find.text('Skip'), findsOneWidget);
      expect(find.text('Next'), findsOneWidget);
    });

    testWidgets('can complete onboarding flow', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Tap through onboarding steps
      final nextButton = find.text('Next');

      // Step 1 -> 2
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Step 2 -> 3
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Step 3 -> 4
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Final step - Get Started
      final getStartedButton = find.text('Get Started');
      expect(getStartedButton, findsOneWidget);

      await tester.tap(getStartedButton);
      await tester.pumpAndSettle();

      // Should navigate to login screen
      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('can skip onboarding', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Tap skip
      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle();

      // Should navigate to login screen
      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('shows login screen after onboarding completed', (
      tester,
    ) async {
      SharedPreferences.setMockInitialValues({'onboarding_completed': true});
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Should show login screen directly
      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('can navigate to register from login', (tester) async {
      SharedPreferences.setMockInitialValues({'onboarding_completed': true});
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Find and tap register link
      final registerLink = find.text('Register');
      await tester.tap(registerLink);
      await tester.pumpAndSettle();

      // Should show register screen
      expect(find.text('Create Account'), findsOneWidget);
    });

    testWidgets('validates login form', (tester) async {
      SharedPreferences.setMockInitialValues({'onboarding_completed': true});
      final prefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Tap login without filling form
      final loginButton = find.text('Sign In');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Should show validation errors
      expect(find.textContaining('required'), findsWidgets);
    });
  });
}
