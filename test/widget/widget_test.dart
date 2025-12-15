import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_template/presentation/theme/foundations/buttons.dart';
import 'package:app_template/presentation/theme/foundations/icons.dart';
import 'package:app_template/presentation/theme/foundations/inputs.dart';
import 'package:app_template/presentation/widgets/empty_state.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('AppFilledButton', () {
    testWidgets('renders with label', (tester) async {
      await tester.pumpApp(
        const AppFilledButton(label: 'Test Button', onPressed: null),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('renders all sizes', (tester) async {
      for (final size in AppButtonSize.values) {
        await tester.pumpApp(
          AppFilledButton(label: 'Button $size', size: size, onPressed: null),
        );

        expect(find.text('Button $size'), findsOneWidget);
      }
    });

    testWidgets('renders with icon', (tester) async {
      await tester.pumpApp(
        const AppFilledButton(
          label: 'With Icon',
          icon: Icons.add,
          onPressed: null,
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('With Icon'), findsOneWidget);
    });

    testWidgets('shows loading indicator', (tester) async {
      await tester.pumpApp(
        const AppFilledButton(
          label: 'Loading',
          isLoading: true,
          onPressed: null,
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('onPressed callback is triggered', (tester) async {
      var pressed = false;

      await tester.pumpApp(
        AppFilledButton(label: 'Pressable', onPressed: () => pressed = true),
      );

      await tester.tap(find.text('Pressable'));
      expect(pressed, isTrue);
    });
  });

  group('AppOutlinedButton', () {
    testWidgets('renders with label', (tester) async {
      await tester.pumpApp(
        const AppOutlinedButton(label: 'Outlined Button', onPressed: null),
      );

      expect(find.text('Outlined Button'), findsOneWidget);
    });
  });

  group('AppTextButton', () {
    testWidgets('renders with label', (tester) async {
      await tester.pumpApp(
        const AppTextButton(label: 'Text Button', onPressed: null),
      );

      expect(find.text('Text Button'), findsOneWidget);
    });
  });

  group('AppPasswordField', () {
    testWidgets('renders with label', (tester) async {
      await tester.pumpApp(
        const SizedBox(
          width: 300,
          child: AppPasswordField(labelText: 'Password'),
        ),
      );

      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('toggles password visibility', (tester) async {
      await tester.pumpApp(
        const SizedBox(
          width: 300,
          child: AppPasswordField(labelText: 'Password'),
        ),
      );

      // Find visibility toggle button
      final toggleButton = find.byType(IconButton);
      expect(toggleButton, findsOneWidget);

      // Initially should show visibility icon (password is obscured)
      expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);

      // Tap to show password
      await tester.tap(toggleButton);
      await tester.pump();

      // Should now show visibility_off icon
      expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
    });

    testWidgets('shows error text', (tester) async {
      await tester.pumpApp(
        const SizedBox(
          width: 300,
          child: AppPasswordField(
            labelText: 'Password',
            errorText: 'Password is required',
          ),
        ),
      );

      expect(find.text('Password is required'), findsOneWidget);
    });
  });

  group('AppSearchField', () {
    testWidgets('renders with hint', (tester) async {
      await tester.pumpApp(
        const SizedBox(
          width: 300,
          child: AppSearchField(hintText: 'Search...'),
        ),
      );

      expect(find.text('Search...'), findsOneWidget);
    });

    testWidgets('shows clear button when has text', (tester) async {
      final controller = TextEditingController(text: 'query');

      await tester.pumpApp(
        SizedBox(
          width: 300,
          child: AppSearchField(controller: controller, hintText: 'Search...'),
        ),
      );

      // Should show clear button
      expect(find.byIcon(Icons.clear), findsOneWidget);
    });
  });

  group('AppIconContainer', () {
    testWidgets('renders icon in all sizes', (tester) async {
      for (final size in AppIconContainerSize.values) {
        await tester.pumpApp(AppIconContainer(icon: Icons.star, size: size));

        expect(find.byIcon(Icons.star), findsOneWidget);
      }
    });

    testWidgets('renders with custom colors', (tester) async {
      await tester.pumpApp(
        AppIconContainer(
          icon: Icons.home,
          backgroundColor: Colors.blue.shade100,
          color: Colors.blue,
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
    });
  });

  group('AppAvatar', () {
    testWidgets('renders with name initials', (tester) async {
      await tester.pumpApp(
        const AppAvatar(name: 'John Doe', size: AppAvatarSize.large),
      );

      // Should show initials JD
      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('renders in all sizes', (tester) async {
      for (final size in AppAvatarSize.values) {
        await tester.pumpApp(AppAvatar(name: 'Test User', size: size));

        expect(find.text('TU'), findsOneWidget);
      }
    });
  });

  group('EmptyState', () {
    testWidgets('renders with message', (tester) async {
      await tester.pumpApp(
        const EmptyState(
          message: 'No items to display',
          icon: Icons.inbox_outlined,
        ),
      );

      expect(find.text('No items to display'), findsOneWidget);
      expect(find.byIcon(Icons.inbox_outlined), findsOneWidget);
    });

    testWidgets('renders with title and message', (tester) async {
      await tester.pumpApp(
        const EmptyState(
          title: 'No Results',
          message: 'Try different search terms',
          icon: Icons.search_off_outlined,
        ),
      );

      expect(find.text('No Results'), findsOneWidget);
      expect(find.text('Try different search terms'), findsOneWidget);
    });

    testWidgets('renders with action button', (tester) async {
      var actionPressed = false;

      await tester.pumpApp(
        EmptyState(
          message: 'No items',
          icon: Icons.inbox_outlined,
          actionLabel: 'Add Item',
          onAction: () => actionPressed = true,
        ),
      );

      expect(find.text('Add Item'), findsOneWidget);

      await tester.tap(find.text('Add Item'));
      expect(actionPressed, isTrue);
    });

    testWidgets('renders with secondary action', (tester) async {
      await tester.pumpApp(
        EmptyState(
          message: 'Connection error',
          icon: Icons.wifi_off_outlined,
          actionLabel: 'Try Again',
          onAction: () {},
          secondaryActionLabel: 'Go Offline',
          onSecondaryAction: () {},
        ),
      );

      expect(find.text('Try Again'), findsOneWidget);
      expect(find.text('Go Offline'), findsOneWidget);
    });
  });

  group('CompactEmptyState', () {
    testWidgets('renders with message', (tester) async {
      await tester.pumpApp(
        const CompactEmptyState(
          message: 'No notifications',
          icon: Icons.notifications_none,
        ),
      );

      expect(find.text('No notifications'), findsOneWidget);
      expect(find.byIcon(Icons.notifications_none), findsOneWidget);
    });

    testWidgets('renders with action', (tester) async {
      var actionPressed = false;

      await tester.pumpApp(
        CompactEmptyState(
          message: 'Empty cart',
          icon: Icons.shopping_cart_outlined,
          actionLabel: 'Browse',
          onAction: () => actionPressed = true,
        ),
      );

      expect(find.text('Browse'), findsOneWidget);

      await tester.tap(find.text('Browse'));
      expect(actionPressed, isTrue);
    });
  });
}
