import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base failure class for all app-level failures.
///
/// Uses freezed for immutability and pattern matching support.
@freezed
sealed class Failure with _$Failure {
  const Failure._();

  /// Network-related failures (no internet, timeout, etc.)
  const factory Failure.network({
    required String message,
    int? statusCode,
    @Default(false) bool isTimeout,
    @Default(false) bool isConnectionError,
  }) = NetworkFailure;

  /// Server-side failures (5xx errors)
  const factory Failure.server({
    required String message,
    int? statusCode,
    String? serverMessage,
  }) = ServerFailure;

  /// Authentication failures (401, 403)
  const factory Failure.auth({
    required String message,
    @Default(false) bool isTokenExpired,
    @Default(false) bool isUnauthorized,
    @Default(false) bool isForbidden,
  }) = AuthFailure;

  /// Validation failures (400, 422)
  const factory Failure.validation({
    required String message,
    Map<String, List<String>>? fieldErrors,
  }) = ValidationFailure;

  /// Resource not found (404)
  const factory Failure.notFound({required String message, String? resource}) =
      NotFoundFailure;

  /// Rate limiting (429)
  const factory Failure.rateLimit({
    required String message,
    Duration? retryAfter,
  }) = RateLimitFailure;

  /// Request cancelled
  const factory Failure.cancelled({
    @Default('Request was cancelled') String message,
  }) = CancelledFailure;

  /// Cache failures
  const factory Failure.cache({required String message}) = CacheFailure;

  /// Unknown/unexpected failures
  const factory Failure.unknown({
    required String message,
    Object? error,
    StackTrace? stackTrace,
  }) = UnknownFailure;

  /// Whether this failure is recoverable (can retry)
  bool get isRecoverable => switch (this) {
    NetworkFailure(isTimeout: true) => true,
    NetworkFailure(isConnectionError: true) => true,
    ServerFailure() => true,
    RateLimitFailure() => true,
    _ => false,
  };

  /// Whether this failure requires re-authentication
  bool get requiresAuth => switch (this) {
    AuthFailure(isTokenExpired: true) => true,
    AuthFailure(isUnauthorized: true) => true,
    _ => false,
  };
}

/// Extension for easy failure message access
extension FailureX on Failure {
  /// Get user-friendly error message
  String get userMessage => switch (this) {
    NetworkFailure(isTimeout: true) =>
      'Connection timed out. Please try again.',
    NetworkFailure(isConnectionError: true) =>
      'No internet connection. Please check your network.',
    NetworkFailure(:final message) => message,
    ServerFailure() => 'Server error. Please try again later.',
    AuthFailure(isTokenExpired: true) =>
      'Session expired. Please log in again.',
    AuthFailure(isForbidden: true) =>
      'You don\'t have permission to access this.',
    AuthFailure(:final message) => message,
    ValidationFailure(:final message) => message,
    NotFoundFailure(:final resource) =>
      resource != null
          ? '$resource not found.'
          : 'The requested resource was not found.',
    RateLimitFailure() => 'Too many requests. Please wait and try again.',
    CancelledFailure() => 'Request was cancelled.',
    CacheFailure(:final message) => message,
    UnknownFailure(:final message) => message,
  };
}
