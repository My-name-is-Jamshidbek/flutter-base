import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:app_template/core/di/providers.dart';
import 'package:app_template/domain/entities/user.dart';
import 'package:app_template/domain/entities/auth_token.dart';
import 'package:app_template/presentation/router/guards.dart';

/// Keys for storing auth data in SharedPreferences.
abstract class AuthKeys {
  static const String accessToken = 'auth_access_token';
  static const String refreshToken = 'auth_refresh_token';
  static const String tokenExpiry = 'auth_token_expiry';
  static const String user = 'auth_user';
  static const String onboardingCompleted = 'onboarding_completed';
}

/// Authentication state.
class AuthState {
  final AuthToken? token;
  final User? user;
  final bool isLoading;
  final bool isInitialized;
  final Object? error;

  const AuthState({
    this.token,
    this.user,
    this.isLoading = false,
    this.isInitialized = false,
    this.error,
  });

  /// Whether the user is authenticated.
  bool get isAuthenticated => token != null && token!.isValid && user != null;

  /// Whether authentication is in progress.
  bool get isAuthenticating => isLoading;

  /// Whether there was an authentication error.
  bool get hasError => error != null;

  /// Get the authentication status for route guards.
  AuthStatus get authStatus {
    if (!isInitialized) return AuthStatus.loading;
    if (isAuthenticated) return AuthStatus.authenticated;
    return AuthStatus.unauthenticated;
  }

  AuthState copyWith({
    AuthToken? token,
    bool clearToken = false,
    User? user,
    bool clearUser = false,
    bool? isLoading,
    bool? isInitialized,
    Object? error,
    bool clearError = false,
  }) {
    return AuthState(
      token: clearToken ? null : (token ?? this.token),
      user: clearUser ? null : (user ?? this.user),
      isLoading: isLoading ?? this.isLoading,
      isInitialized: isInitialized ?? this.isInitialized,
      error: clearError ? null : (error ?? this.error),
    );
  }

  /// Create initial state.
  factory AuthState.initial() => const AuthState();

  /// Create loading state.
  factory AuthState.loading() => const AuthState(isLoading: true);

  /// Create authenticated state.
  factory AuthState.authenticated({
    required AuthToken token,
    required User user,
  }) {
    return AuthState(token: token, user: user, isInitialized: true);
  }

  /// Create unauthenticated state.
  factory AuthState.unauthenticated() {
    return const AuthState(isInitialized: true);
  }

  /// Create error state.
  factory AuthState.error(Object error) {
    return AuthState(error: error, isInitialized: true);
  }
}

/// Authentication notifier for managing auth state.
class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    // Schedule initialization after build returns (state is ready)
    Future.microtask(_initializeAuth);
    return AuthState.initial();
  }

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  /// Initialize auth state from persisted data.
  Future<void> _initializeAuth() async {
    state = state.copyWith(isLoading: true);

    try {
      final accessToken = _prefs.getString(AuthKeys.accessToken);
      final refreshToken = _prefs.getString(AuthKeys.refreshToken);
      final expiryString = _prefs.getString(AuthKeys.tokenExpiry);
      final userJson = _prefs.getString(AuthKeys.user);

      if (accessToken != null && accessToken.isNotEmpty) {
        final token = AuthToken(
          accessToken: accessToken,
          refreshToken: refreshToken,
          expiresAt: expiryString != null
              ? DateTime.tryParse(expiryString)
              : null,
        );

        User? user;
        if (userJson != null) {
          try {
            user = User.fromJson(json.decode(userJson) as Map<String, dynamic>);
          } catch (_) {
            // Invalid user JSON, continue without user
          }
        }

        if (token.isValid && user != null) {
          state = AuthState.authenticated(token: token, user: user);
          return;
        }
      }

      state = AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(e);
    }
  }

  /// Sign in with email and password.
  Future<void> signIn({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      // TODO: Replace with actual API call
      // final result = await ref.read(authRepositoryProvider).signIn(
      //   email: email,
      //   password: password,
      // );

      // Simulated response for template
      await Future.delayed(const Duration(seconds: 1));

      final token = AuthToken(
        accessToken: 'mock_access_token',
        refreshToken: 'mock_refresh_token',
        expiresAt: DateTime.now().add(const Duration(days: 7)),
      );

      final user = User(
        id: '1',
        email: email,
        name: email.split('@').first,
        emailVerified: true,
      );

      await _persistAuth(token: token, user: user);
      state = AuthState.authenticated(token: token, user: user);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e);
      rethrow;
    }
  }

  /// Sign up with email and password.
  Future<void> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      // TODO: Replace with actual API call
      await Future.delayed(const Duration(seconds: 1));

      final token = AuthToken(
        accessToken: 'mock_access_token',
        refreshToken: 'mock_refresh_token',
        expiresAt: DateTime.now().add(const Duration(days: 7)),
      );

      final user = User(
        id: '1',
        email: email,
        name: name ?? email.split('@').first,
        emailVerified: false,
      );

      await _persistAuth(token: token, user: user);
      state = AuthState.authenticated(token: token, user: user);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e);
      rethrow;
    }
  }

  /// Sign out the current user.
  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);

    try {
      // TODO: Call API to invalidate token if needed

      await _clearAuth();
      state = AuthState.unauthenticated();
    } catch (e) {
      // Still sign out locally even if API call fails
      await _clearAuth();
      state = AuthState.unauthenticated();
    }
  }

  /// Refresh the access token.
  Future<void> refreshToken() async {
    final currentToken = state.token;
    if (currentToken == null || !currentToken.canRefresh) {
      await signOut();
      return;
    }

    try {
      // TODO: Replace with actual API call
      await Future.delayed(const Duration(milliseconds: 500));

      final newToken = AuthToken(
        accessToken: 'new_mock_access_token',
        refreshToken: currentToken.refreshToken,
        expiresAt: DateTime.now().add(const Duration(days: 7)),
      );

      await _persistToken(newToken);
      state = state.copyWith(token: newToken);
    } catch (e) {
      // Refresh failed, sign out
      await signOut();
    }
  }

  /// Update the current user.
  Future<void> updateUser(User user) async {
    await _prefs.setString(AuthKeys.user, json.encode(user.toJson()));
    state = state.copyWith(user: user);
  }

  /// Persist auth data.
  Future<void> _persistAuth({
    required AuthToken token,
    required User user,
  }) async {
    await Future.wait([
      _persistToken(token),
      _prefs.setString(AuthKeys.user, json.encode(user.toJson())),
    ]);
  }

  /// Persist token data.
  Future<void> _persistToken(AuthToken token) async {
    await Future.wait([
      _prefs.setString(AuthKeys.accessToken, token.accessToken),
      if (token.refreshToken != null)
        _prefs.setString(AuthKeys.refreshToken, token.refreshToken!),
      if (token.expiresAt != null)
        _prefs.setString(
          AuthKeys.tokenExpiry,
          token.expiresAt!.toIso8601String(),
        ),
    ]);
  }

  /// Clear all auth data.
  Future<void> _clearAuth() async {
    await Future.wait([
      _prefs.remove(AuthKeys.accessToken),
      _prefs.remove(AuthKeys.refreshToken),
      _prefs.remove(AuthKeys.tokenExpiry),
      _prefs.remove(AuthKeys.user),
    ]);
  }
}

/// Provider for auth state.
final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

/// Provider for current user.
final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authProvider).user;
});

/// Provider for auth token.
final authTokenProvider = Provider<AuthToken?>((ref) {
  return ref.watch(authProvider).token;
});

/// Provider for checking if user is authenticated.
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isAuthenticated;
});

/// Provider for auth status (for guards).
final authStatusProvider = Provider<AuthStatus>((ref) {
  return ref.watch(authProvider).authStatus;
});
