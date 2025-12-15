import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/router/routes.dart';
import 'package:app_template/presentation/theme/theme.dart';

/// Error screen for 404 and other navigation errors.
class ErrorScreen extends StatelessWidget {
  final Exception? error;
  final String? location;

  const ErrorScreen({super.key, this.error, this.location});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.errorScreenTitle)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Error icon with container
              AppIconContainer(
                icon: Icons.error_outline,
                size: AppIconContainerSize.xl,
                color: colorScheme.onErrorContainer,
                backgroundColor: colorScheme.errorContainer,
              ),

              AppSpacing.verticalGapXl,

              // Title
              Text(
                l10n.pageNotFound,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              AppSpacing.verticalGapMd,

              // Location message
              if (location != null) ...[
                Text(
                  l10n.pageNotFoundMessage(location!),
                  style: AppTextStyles.cardSubtitle(context),
                  textAlign: TextAlign.center,
                ),
                AppSpacing.verticalGapSm,
              ],

              // Error details
              if (error != null) ...[
                Text(
                  error.toString(),
                  style: AppTextStyles.error(context),
                  textAlign: TextAlign.center,
                ),
                AppSpacing.verticalGapMd,
              ],

              AppSpacing.verticalGapXl,

              // Go Home button
              AppFilledButton(
                label: l10n.goHome,
                icon: Icons.home,
                size: AppButtonSize.large,
                onPressed: () => context.go(RoutePaths.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// User detail screen with typed route parameter.
class UserDetailScreen extends StatelessWidget {
  final int userId;

  const UserDetailScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.userDetailTitle(userId)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // User icon container
              AppIconContainer(
                icon: Icons.person,
                size: AppIconContainerSize.xl,
                color: colorScheme.onPrimaryContainer,
                backgroundColor: colorScheme.primaryContainer,
              ),

              AppSpacing.verticalGapXl,

              // Title
              Text(
                l10n.userDetail,
                style: AppTextStyles.cardTitle(
                  context,
                ).copyWith(fontSize: theme.textTheme.headlineMedium?.fontSize),
              ),

              AppSpacing.verticalGapMd,

              // Subtitle
              Text(
                l10n.viewingUserWithId(userId),
                style: AppTextStyles.cardSubtitle(context),
              ),

              AppSpacing.verticalGapXl,

              // Demo hint card
              AppCard(
                outlined: true,
                padding: AppSurfaces.cardPaddingStandard,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: AppIconSizes.md,
                      color: colorScheme.primary,
                    ),
                    AppSpacing.horizontalGapSm,
                    Flexible(
                      child: Text(
                        l10n.typedRouteParamsDemo,
                        style: AppTextStyles.caption(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Item detail screen with typed route parameter.
class ItemDetailScreen extends StatelessWidget {
  final int itemId;

  const ItemDetailScreen({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.itemDetailTitle(itemId)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Item icon container
              AppIconContainer(
                icon: Icons.inventory_2_outlined,
                size: AppIconContainerSize.xl,
                color: colorScheme.onSecondaryContainer,
                backgroundColor: colorScheme.secondaryContainer,
              ),

              AppSpacing.verticalGapXl,

              // Title
              Text(
                l10n.itemDetail,
                style: AppTextStyles.cardTitle(
                  context,
                ).copyWith(fontSize: theme.textTheme.headlineMedium?.fontSize),
              ),

              AppSpacing.verticalGapMd,

              // Subtitle
              Text(
                l10n.viewingItemWithId(itemId),
                style: AppTextStyles.cardSubtitle(context),
              ),

              AppSpacing.verticalGapXl,

              // Demo hint card
              AppCard(
                outlined: true,
                padding: AppSurfaces.cardPaddingStandard,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: AppIconSizes.md,
                      color: colorScheme.secondary,
                    ),
                    AppSpacing.horizontalGapSm,
                    Flexible(
                      child: Text(
                        l10n.typedRouteParamsDemo,
                        style: AppTextStyles.caption(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
