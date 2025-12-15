import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/router/routes.dart';
import 'package:app_template/presentation/theme/theme.dart';

/// Main shell widget with bottom navigation using theme foundation.
class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final location = GoRouterState.of(context).matchedLocation;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _getSelectedIndex(location),
        onDestinationSelected: (index) =>
            _onDestinationSelected(context, index),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, size: AppIconSizes.bottomNav),
            selectedIcon: Icon(Icons.home, size: AppIconSizes.bottomNav),
            label: l10n.homeTitle,
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, size: AppIconSizes.bottomNav),
            selectedIcon: Icon(Icons.person, size: AppIconSizes.bottomNav),
            label: l10n.profileTitle,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined, size: AppIconSizes.bottomNav),
            selectedIcon: Icon(Icons.settings, size: AppIconSizes.bottomNav),
            label: l10n.settingsTitle,
          ),
        ],
      ),
    );
  }

  int _getSelectedIndex(String location) {
    if (location.startsWith(RoutePaths.settings)) return 2;
    if (location.startsWith(RoutePaths.profile)) return 1;
    return 0;
  }

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goToHome();
        break;
      case 1:
        context.goToProfile();
        break;
      case 2:
        context.goToSettings();
        break;
    }
  }
}
