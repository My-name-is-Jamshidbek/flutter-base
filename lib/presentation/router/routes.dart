import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Route paths for the application.
///
/// Defines all route paths as constants for type-safe navigation.
abstract class RoutePaths {
  // Root paths
  static const String root = '/';

  // Auth paths
  static const String auth = '/auth';
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';

  // Onboarding paths
  static const String onboarding = '/onboarding';

  // Main app paths
  static const String home = '/home';
  static const String settings = '/settings';
  static const String profile = '/profile';

  // Detail paths with parameters
  static const String userDetail = '/user/:id';
  static const String itemDetail = '/item/:id';

  // Nested paths
  static const String settingsAccount = '/settings/account';
  static const String settingsNotifications = '/settings/notifications';
  static const String settingsPrivacy = '/settings/privacy';
}

/// Route names for named navigation.
abstract class RouteNames {
  static const String splash = 'splash';
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgotPassword';
  static const String home = 'home';
  static const String settings = 'settings';
  static const String profile = 'profile';
  static const String userDetail = 'userDetail';
  static const String itemDetail = 'itemDetail';
  static const String settingsAccount = 'settingsAccount';
  static const String settingsNotifications = 'settingsNotifications';
  static const String settingsPrivacy = 'settingsPrivacy';
}

/// Typed route parameters.
///
/// Provides type-safe access to route parameters.
class TypedRouteParams {
  final GoRouterState state;

  const TypedRouteParams(this.state);

  /// Get an integer parameter from the route.
  int? getInt(String name) {
    final value = state.pathParameters[name];
    if (value == null) return null;
    return int.tryParse(value);
  }

  /// Get a required integer parameter from the route.
  int requireInt(String name) {
    final value = getInt(name);
    if (value == null) {
      throw ArgumentError(
        'Required integer parameter "$name" is missing or invalid',
      );
    }
    return value;
  }

  /// Get a string parameter from the route.
  String? getString(String name) {
    return state.pathParameters[name];
  }

  /// Get a required string parameter from the route.
  String requireString(String name) {
    final value = getString(name);
    if (value == null || value.isEmpty) {
      throw ArgumentError('Required string parameter "$name" is missing');
    }
    return value;
  }

  /// Get a query parameter as string.
  String? getQueryString(String name) {
    return state.uri.queryParameters[name];
  }

  /// Get a query parameter as int.
  int? getQueryInt(String name) {
    final value = getQueryString(name);
    if (value == null) return null;
    return int.tryParse(value);
  }

  /// Get a query parameter as bool.
  bool? getQueryBool(String name) {
    final value = getQueryString(name);
    if (value == null) return null;
    return value.toLowerCase() == 'true' || value == '1';
  }

  /// Get extra data from the route.
  T? getExtra<T>() {
    return state.extra as T?;
  }

  /// Get required extra data from the route.
  T requireExtra<T>() {
    final extra = getExtra<T>();
    if (extra == null) {
      throw ArgumentError('Required extra data of type $T is missing');
    }
    return extra;
  }
}

/// Extension on GoRouterState for typed params.
extension TypedParamsExtension on GoRouterState {
  TypedRouteParams get typed => TypedRouteParams(this);
}

/// Extension on BuildContext for typed navigation.
extension TypedNavigationExtension on BuildContext {
  /// Navigate to user detail page.
  void goToUserDetail(int id, {Object? extra}) {
    GoRouter.of(this).goNamed(
      RouteNames.userDetail,
      pathParameters: {'id': id.toString()},
      extra: extra,
    );
  }

  /// Push user detail page onto stack.
  void pushUserDetail(int id, {Object? extra}) {
    GoRouter.of(this).pushNamed(
      RouteNames.userDetail,
      pathParameters: {'id': id.toString()},
      extra: extra,
    );
  }

  /// Navigate to item detail page.
  void goToItemDetail(int id, {Map<String, String>? queryParams}) {
    GoRouter.of(this).goNamed(
      RouteNames.itemDetail,
      pathParameters: {'id': id.toString()},
      queryParameters: queryParams ?? {},
    );
  }

  /// Navigate to settings.
  void goToSettings() {
    GoRouter.of(this).goNamed(RouteNames.settings);
  }

  /// Push settings onto stack.
  void pushSettings() {
    GoRouter.of(this).pushNamed(RouteNames.settings);
  }

  /// Navigate to home.
  void goToHome() {
    GoRouter.of(this).goNamed(RouteNames.home);
  }

  /// Navigate to login.
  void goToLogin() {
    GoRouter.of(this).goNamed(RouteNames.login);
  }

  /// Navigate to register.
  void goToRegister() {
    GoRouter.of(this).goNamed(RouteNames.register);
  }

  /// Navigate to forgot password.
  void goToForgotPassword() {
    GoRouter.of(this).goNamed(RouteNames.forgotPassword);
  }

  /// Push forgot password onto stack.
  void pushForgotPassword() {
    GoRouter.of(this).pushNamed(RouteNames.forgotPassword);
  }

  /// Navigate to onboarding.
  void goToOnboarding() {
    GoRouter.of(this).goNamed(RouteNames.onboarding);
  }

  /// Navigate to profile.
  void goToProfile() {
    GoRouter.of(this).goNamed(RouteNames.profile);
  }

  /// Push profile onto stack.
  void pushProfile() {
    GoRouter.of(this).pushNamed(RouteNames.profile);
  }
}
