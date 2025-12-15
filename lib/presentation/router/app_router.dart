import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:app_template/core/di/auth_provider.dart';
import 'package:app_template/core/di/onboarding_provider.dart';
import 'package:app_template/presentation/features/features.dart';
import 'package:app_template/presentation/router/routes.dart';

export 'routes.dart';
export 'guards.dart';

/// Application router configuration using GoRouter with guards.
///
/// Uses Riverpod for state management and route guards.
class AppRouter {
  final Ref ref;

  AppRouter(this.ref);

  /// Routes that don't require authentication.
  static const _publicRoutes = [
    RoutePaths.auth,
    RoutePaths.login,
    RoutePaths.register,
    RoutePaths.forgotPassword,
    RoutePaths.onboarding,
  ];

  /// Routes that are only for guests (redirect if authenticated).
  static const _guestOnlyRoutes = [
    RoutePaths.login,
    RoutePaths.register,
    RoutePaths.forgotPassword,
  ];

  /// Build the GoRouter instance.
  GoRouter get router => GoRouter(
    initialLocation: RoutePaths.root,
    debugLogDiagnostics: true,
    refreshListenable: _RouterRefreshNotifier(ref),
    redirect: _handleRedirect,
    routes: _routes,
    errorBuilder: _errorBuilder,
  );

  /// Handle route redirects based on auth and onboarding state.
  String? _handleRedirect(BuildContext context, GoRouterState state) {
    final authState = ref.read(authProvider);
    final onboardingState = ref.read(onboardingProvider);
    final location = state.matchedLocation;

    // Wait for initialization
    if (!authState.isInitialized || !onboardingState.isInitialized) {
      // Show splash while loading
      if (location != RoutePaths.root) {
        return RoutePaths.root;
      }
      return null;
    }

    final isAuthenticated = authState.isAuthenticated;
    final isOnboardingCompleted =
        onboardingState.isCompleted || onboardingState.isSkipped;
    final isPublicRoute = _publicRoutes.any((r) => location.startsWith(r));
    final isGuestOnlyRoute = _guestOnlyRoutes.any(
      (r) => location.startsWith(r),
    );
    final isOnboardingRoute = location.startsWith(RoutePaths.onboarding);
    final isRootRoute = location == RoutePaths.root;

    // Handle root route - redirect based on state
    if (isRootRoute) {
      if (!isOnboardingCompleted) {
        return RoutePaths.onboarding;
      }
      if (!isAuthenticated) {
        return RoutePaths.login;
      }
      return RoutePaths.home;
    }

    // Redirect authenticated users away from guest-only routes
    if (isAuthenticated && isGuestOnlyRoute) {
      return RoutePaths.home;
    }

    // Redirect users who completed onboarding away from onboarding
    if (isOnboardingCompleted && isOnboardingRoute) {
      if (!isAuthenticated) {
        return RoutePaths.login;
      }
      return RoutePaths.home;
    }

    // Redirect unauthenticated users to login for protected routes
    if (!isAuthenticated && !isPublicRoute) {
      return RoutePaths.login;
    }

    // Redirect users who haven't completed onboarding
    if (!isOnboardingCompleted && !isOnboardingRoute && !isGuestOnlyRoute) {
      return RoutePaths.onboarding;
    }

    return null;
  }

  /// Route definitions.
  List<RouteBase> get _routes => [
    // Splash/Root route
    GoRoute(
      path: RoutePaths.root,
      name: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    // Onboarding route
    GoRoute(
      path: RoutePaths.onboarding,
      name: RouteNames.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),

    // Auth routes
    GoRoute(
      path: RoutePaths.login,
      name: RouteNames.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RoutePaths.register,
      name: RouteNames.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: RoutePaths.forgotPassword,
      name: RouteNames.forgotPassword,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),

    // Main app shell with bottom navigation
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        // Home
        GoRoute(
          path: RoutePaths.home,
          name: RouteNames.home,
          builder: (context, state) => const HomeScreen(),
        ),

        // Profile
        GoRoute(
          path: RoutePaths.profile,
          name: RouteNames.profile,
          builder: (context, state) => const ProfileScreen(),
        ),

        // Settings with nested routes
        GoRoute(
          path: RoutePaths.settings,
          name: RouteNames.settings,
          builder: (context, state) => const SettingsScreen(),
          routes: [
            GoRoute(
              path: 'account',
              name: RouteNames.settingsAccount,
              builder: (context, state) => const AccountSettingsScreen(),
            ),
            GoRoute(
              path: 'notifications',
              name: RouteNames.settingsNotifications,
              builder: (context, state) => const NotificationSettingsScreen(),
            ),
            GoRoute(
              path: 'privacy',
              name: RouteNames.settingsPrivacy,
              builder: (context, state) => const PrivacySettingsScreen(),
            ),
          ],
        ),
      ],
    ),

    // Detail routes (outside shell for full-screen experience)
    GoRoute(
      path: RoutePaths.userDetail,
      name: RouteNames.userDetail,
      builder: (context, state) {
        final userId = state.typed.requireInt('id');
        return UserDetailScreen(userId: userId);
      },
    ),
    GoRoute(
      path: RoutePaths.itemDetail,
      name: RouteNames.itemDetail,
      builder: (context, state) {
        final itemId = state.typed.requireInt('id');
        return ItemDetailScreen(itemId: itemId);
      },
    ),
  ];

  /// Error page builder.
  Widget _errorBuilder(BuildContext context, GoRouterState state) {
    return ErrorScreen(error: state.error, location: state.uri.toString());
  }
}

/// Listenable that triggers router refresh on auth/onboarding changes.
class _RouterRefreshNotifier extends ChangeNotifier {
  _RouterRefreshNotifier(this._ref) {
    // Listen to auth changes
    _ref.listen(authProvider, (_, __) {
      notifyListeners();
    });

    // Listen to onboarding changes
    _ref.listen(onboardingProvider, (_, __) {
      notifyListeners();
    });
  }

  final Ref _ref;
}

/// Provider for the app router.
final appRouterProvider = Provider<GoRouter>((ref) {
  return AppRouter(ref).router;
});

// Keep old Routes class for backward compatibility
// TODO: Remove after updating all usages to use RoutePaths/RouteNames
abstract class Routes {
  @Deprecated('Use RoutePaths.home instead')
  static const String home = RoutePaths.home;

  @Deprecated('Use RoutePaths.settings instead')
  static const String settings = RoutePaths.settings;
}
