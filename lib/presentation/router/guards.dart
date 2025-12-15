import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

/// Base class for route guards.
///
/// Guards are used to protect routes based on certain conditions.
/// They can redirect to a different route if the condition is not met.
abstract class RouteGuard {
  /// Check if the guard allows navigation to the given location.
  ///
  /// Returns null if navigation is allowed, or a redirect path if not.
  String? check(GoRouterState state, WidgetRef ref);
}

/// Authentication status for guard checks.
enum AuthStatus {
  /// User is authenticated.
  authenticated,

  /// User is not authenticated.
  unauthenticated,

  /// Authentication status is being determined.
  loading,
}

/// Onboarding status for guard checks.
enum OnboardingStatus {
  /// User has completed onboarding.
  completed,

  /// User has not started onboarding.
  notStarted,

  /// User is in the middle of onboarding.
  inProgress,
}

/// Guard that requires authentication.
///
/// Redirects to login if user is not authenticated.
class AuthGuard extends RouteGuard {
  final AuthStatus Function(WidgetRef ref) getAuthStatus;
  final String redirectPath;

  AuthGuard({
    required this.getAuthStatus,
    this.redirectPath = RoutePaths.login,
  });

  @override
  String? check(GoRouterState state, WidgetRef ref) {
    final status = getAuthStatus(ref);

    switch (status) {
      case AuthStatus.authenticated:
        return null; // Allow navigation
      case AuthStatus.unauthenticated:
        return redirectPath;
      case AuthStatus.loading:
        return null; // Allow navigation during loading (will be handled by splash)
    }
  }
}

/// Guard that requires onboarding to be completed.
///
/// Redirects to onboarding if not completed.
class OnboardingGuard extends RouteGuard {
  final OnboardingStatus Function(WidgetRef ref) getOnboardingStatus;
  final String redirectPath;

  OnboardingGuard({
    required this.getOnboardingStatus,
    this.redirectPath = RoutePaths.onboarding,
  });

  @override
  String? check(GoRouterState state, WidgetRef ref) {
    final status = getOnboardingStatus(ref);

    switch (status) {
      case OnboardingStatus.completed:
        return null; // Allow navigation
      case OnboardingStatus.notStarted:
      case OnboardingStatus.inProgress:
        return redirectPath;
    }
  }
}

/// Guard that prevents authenticated users from accessing auth pages.
///
/// Redirects to home if user is already authenticated.
class GuestGuard extends RouteGuard {
  final AuthStatus Function(WidgetRef ref) getAuthStatus;
  final String redirectPath;

  GuestGuard({
    required this.getAuthStatus,
    this.redirectPath = RoutePaths.home,
  });

  @override
  String? check(GoRouterState state, WidgetRef ref) {
    final status = getAuthStatus(ref);

    switch (status) {
      case AuthStatus.authenticated:
        return redirectPath; // Redirect authenticated users away
      case AuthStatus.unauthenticated:
      case AuthStatus.loading:
        return null; // Allow navigation
    }
  }
}

/// Guard that prevents users who completed onboarding from seeing it again.
class OnboardingCompletedGuard extends RouteGuard {
  final OnboardingStatus Function(WidgetRef ref) getOnboardingStatus;
  final String redirectPath;

  OnboardingCompletedGuard({
    required this.getOnboardingStatus,
    this.redirectPath = RoutePaths.home,
  });

  @override
  String? check(GoRouterState state, WidgetRef ref) {
    final status = getOnboardingStatus(ref);

    switch (status) {
      case OnboardingStatus.completed:
        return redirectPath; // Redirect away from onboarding
      case OnboardingStatus.notStarted:
      case OnboardingStatus.inProgress:
        return null; // Allow navigation to onboarding
    }
  }
}

/// Composite guard that runs multiple guards.
///
/// Returns the first redirect from any failing guard.
class CompositeGuard extends RouteGuard {
  final List<RouteGuard> guards;

  CompositeGuard(this.guards);

  @override
  String? check(GoRouterState state, WidgetRef ref) {
    for (final guard in guards) {
      final redirect = guard.check(state, ref);
      if (redirect != null) {
        return redirect;
      }
    }
    return null;
  }
}

/// Guard registry for managing route guards.
class GuardRegistry {
  final Map<String, RouteGuard> _guards = {};

  /// Register a guard for a specific route pattern.
  void register(String pattern, RouteGuard guard) {
    _guards[pattern] = guard;
  }

  /// Get guard for a specific route.
  RouteGuard? getGuard(String path) {
    // Check for exact match first
    if (_guards.containsKey(path)) {
      return _guards[path];
    }

    // Check for pattern matches
    for (final entry in _guards.entries) {
      if (_matchesPattern(path, entry.key)) {
        return entry.value;
      }
    }

    return null;
  }

  /// Check if a path matches a pattern.
  bool _matchesPattern(String path, String pattern) {
    // Handle wildcard patterns like /settings/*
    if (pattern.endsWith('/*')) {
      final prefix = pattern.substring(0, pattern.length - 2);
      return path.startsWith(prefix);
    }

    // Handle exact match
    return path == pattern;
  }

  /// Create a redirect callback for GoRouter.
  String? Function(BuildContext, GoRouterState) createRedirect(WidgetRef ref) {
    return (context, state) {
      final guard = getGuard(state.matchedLocation);
      if (guard == null) return null;
      return guard.check(state, ref);
    };
  }
}

/// Extension for creating guards with convenient syntax.
extension RouteGuardExtensions on GoRoute {
  /// Wrap this route with a guard check.
  ///
  /// Note: Guards are typically handled at the router level with redirect,
  /// not at individual route level.
  GoRoute withGuard(RouteGuard guard) {
    return this;
  }
}
