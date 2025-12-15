import 'package:dio/dio.dart';
import 'package:app_template/core/network/failures.dart';

/// Interceptor for mapping Dio errors to app-level failures.
///
/// Converts DioException to appropriate Failure types for
/// consistent error handling throughout the app.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Map the error to a Failure and attach it to the error
    final failure = _mapToFailure(err);
    err.requestOptions.extra['_failure'] = failure;

    handler.next(err);
  }

  Failure _mapToFailure(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Failure.network(
          message: 'Connection timed out',
          isTimeout: true,
        );

      case DioExceptionType.connectionError:
        return Failure.network(
          message: 'Unable to connect to server',
          isConnectionError: true,
        );

      case DioExceptionType.cancel:
        return const Failure.cancelled();

      case DioExceptionType.badResponse:
        return _mapStatusCodeToFailure(err);

      case DioExceptionType.badCertificate:
        return Failure.network(
          message: 'Invalid SSL certificate',
          statusCode: err.response?.statusCode,
        );

      case DioExceptionType.unknown:
        return Failure.unknown(
          message: err.message ?? 'An unexpected error occurred',
          error: err.error,
          stackTrace: err.stackTrace,
        );
    }
  }

  Failure _mapStatusCodeToFailure(DioException err) {
    final statusCode = err.response?.statusCode ?? 0;
    final data = err.response?.data;

    // Try to extract error message from response
    final serverMessage = _extractErrorMessage(data);

    switch (statusCode) {
      // 400 Bad Request
      case 400:
        return Failure.validation(
          message: serverMessage ?? 'Invalid request',
          fieldErrors: _extractFieldErrors(data),
        );

      // 401 Unauthorized
      case 401:
        final isTokenExpired = _isTokenExpired(data);
        return Failure.auth(
          message: serverMessage ?? 'Authentication required',
          isTokenExpired: isTokenExpired,
          isUnauthorized: true,
        );

      // 403 Forbidden
      case 403:
        return Failure.auth(
          message: serverMessage ?? 'Access denied',
          isForbidden: true,
        );

      // 404 Not Found
      case 404:
        return Failure.notFound(
          message: serverMessage ?? 'Resource not found',
          resource: err.requestOptions.path,
        );

      // 422 Unprocessable Entity
      case 422:
        return Failure.validation(
          message: serverMessage ?? 'Validation failed',
          fieldErrors: _extractFieldErrors(data),
        );

      // 429 Too Many Requests
      case 429:
        final retryAfter = _parseRetryAfter(err.response?.headers);
        return Failure.rateLimit(
          message: serverMessage ?? 'Too many requests',
          retryAfter: retryAfter,
        );

      // 5xx Server Errors
      case >= 500:
        return Failure.server(
          message: serverMessage ?? 'Server error',
          statusCode: statusCode,
          serverMessage: serverMessage,
        );

      default:
        return Failure.unknown(
          message: serverMessage ?? 'Request failed with status $statusCode',
        );
    }
  }

  String? _extractErrorMessage(dynamic data) {
    if (data == null) return null;

    if (data is Map) {
      // Common API error message fields
      return data['message'] as String? ??
          data['error'] as String? ??
          data['error_description'] as String? ??
          data['detail'] as String?;
    }

    if (data is String) {
      return data;
    }

    return null;
  }

  Map<String, List<String>>? _extractFieldErrors(dynamic data) {
    if (data == null || data is! Map) return null;

    final errors = data['errors'] ?? data['field_errors'] ?? data['validation'];
    if (errors == null || errors is! Map) return null;

    final result = <String, List<String>>{};

    for (final entry in errors.entries) {
      final key = entry.key.toString();
      final value = entry.value;

      if (value is List) {
        result[key] = value.map((e) => e.toString()).toList();
      } else if (value is String) {
        result[key] = [value];
      }
    }

    return result.isEmpty ? null : result;
  }

  bool _isTokenExpired(dynamic data) {
    if (data == null || data is! Map) return false;

    final error = data['error'] as String? ?? data['code'] as String?;
    return error == 'token_expired' ||
        error == 'jwt_expired' ||
        error == 'invalid_token';
  }

  Duration? _parseRetryAfter(Headers? headers) {
    if (headers == null) return null;

    final retryAfter = headers.value('retry-after');
    if (retryAfter == null) return null;

    final seconds = int.tryParse(retryAfter);
    if (seconds != null) {
      return Duration(seconds: seconds);
    }

    return null;
  }
}

/// Extension to extract Failure from DioException.
extension DioExceptionX on DioException {
  /// Get the mapped Failure from this exception.
  Failure get failure {
    return requestOptions.extra['_failure'] as Failure? ??
        Failure.unknown(message: message ?? 'Unknown error');
  }
}
