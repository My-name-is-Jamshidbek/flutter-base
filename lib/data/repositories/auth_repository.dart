import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/network/api_client.dart';
import '../../core/network/result.dart';
import '../dto/user_dto.dart';
import 'base_repository.dart';

part 'auth_repository.g.dart';

/// Repository for authentication-related API operations.
///
/// Handles:
/// - Login/logout
/// - Registration
/// - Password reset
/// - Token refresh
/// - Current user management
abstract class AuthRepository {
  /// Login with email and password.
  AsyncResult<AuthTokensDto> login(LoginRequestDto request);

  /// Register a new user.
  AsyncResult<AuthTokensDto> register(RegisterRequestDto request);

  /// Logout the current user.
  AsyncResult<void> logout();

  /// Refresh the access token.
  AsyncResult<AuthTokensDto> refreshToken(String refreshToken);

  /// Get the current authenticated user.
  AsyncResult<UserDto> getCurrentUser();

  /// Update the current user's profile.
  AsyncResult<UserDto> updateProfile(UserProfileDto profile);

  /// Request password reset.
  AsyncResult<void> requestPasswordReset(String email);

  /// Reset password with token.
  AsyncResult<void> resetPassword({
    required String token,
    required String newPassword,
  });

  /// Verify email with token.
  AsyncResult<void> verifyEmail(String token);

  /// Resend verification email.
  AsyncResult<void> resendVerificationEmail();
}

/// Implementation of [AuthRepository].
class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  AuthRepositoryImpl(super.apiClient);

  static const _basePath = '/auth';

  @override
  AsyncResult<AuthTokensDto> login(LoginRequestDto request) async {
    return safeApiCall(
      () => apiClient.post('$_basePath/login', data: request.toJson()),
      (data) => AuthTokensDto.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  AsyncResult<AuthTokensDto> register(RegisterRequestDto request) async {
    return safeApiCall(
      () => apiClient.post('$_basePath/register', data: request.toJson()),
      (data) => AuthTokensDto.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  AsyncResult<void> logout() async {
    return safeApiCallVoid(() => apiClient.post('$_basePath/logout'));
  }

  @override
  AsyncResult<AuthTokensDto> refreshToken(String refreshToken) async {
    return safeApiCall(
      () => apiClient.post(
        '$_basePath/refresh',
        data: {'refresh_token': refreshToken},
      ),
      (data) => AuthTokensDto.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  AsyncResult<UserDto> getCurrentUser() async {
    return safeApiCall(
      () => apiClient.get('$_basePath/me'),
      (data) => UserDto.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  AsyncResult<UserDto> updateProfile(UserProfileDto profile) async {
    return safeApiCall(
      () => apiClient.patch('$_basePath/profile', data: profile.toJson()),
      (data) => UserDto.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  AsyncResult<void> requestPasswordReset(String email) async {
    return safeApiCallVoid(
      () =>
          apiClient.post('$_basePath/forgot-password', data: {'email': email}),
    );
  }

  @override
  AsyncResult<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    return safeApiCallVoid(
      () => apiClient.post(
        '$_basePath/reset-password',
        data: {'token': token, 'password': newPassword},
      ),
    );
  }

  @override
  AsyncResult<void> verifyEmail(String token) async {
    return safeApiCallVoid(
      () => apiClient.post('$_basePath/verify-email', data: {'token': token}),
    );
  }

  @override
  AsyncResult<void> resendVerificationEmail() async {
    return safeApiCallVoid(
      () => apiClient.post('$_basePath/resend-verification'),
    );
  }
}

/// Provider for [AuthRepository].
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final client = ref.watch(httpClientProvider);
  return AuthRepositoryImpl(client);
}
