import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_template/presentation/features/home/home_screen.dart';
import 'package:app_template/presentation/features/settings/settings_screen.dart';

/// Route names for type-safe navigation.
abstract class Routes {
  static const String home = '/';
  static const String settings = '/settings';
}

/// Application router configuration using GoRouter.
final GoRouter appRouter = GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: Routes.settings,
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'Page not found',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(state.uri.toString()),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => context.go(Routes.home),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  ),
);
