import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/theme/theme.dart';

/// Splash screen shown during app initialization.
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo/icon
            Container(
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: AppRadii.borderRadiusXl,
              ),
              child: Icon(
                Icons.flutter_dash,
                size: AppIconSizes.xhuge,
                color: colorScheme.onPrimaryContainer,
              ),
            ),

            AppSpacing.verticalGapXl,

            // App title
            Text(
              AppLocalizations.of(context).appTitle,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),

            AppSpacing.verticalGapXl,

            // Loading indicator
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
