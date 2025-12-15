import 'dart:async';
import 'dart:math';
import 'package:dio/dio.dart';

/// Interceptor for retrying failed requests with exponential backoff.
///
/// Automatically retries requests that fail due to:
/// - Network errors (connection issues, timeouts)
/// - Server errors (5xx status codes)
class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration retryDelay;
  final bool useExponentialBackoff;
  final Set<int> retryableStatusCodes;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
    this.useExponentialBackoff = true,
    this.retryableStatusCodes = const {408, 429, 500, 502, 503, 504},
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Get current retry count
    final retryCount = err.requestOptions.extra['_retryCount'] as int? ?? 0;

    // Check if we should retry
    if (!_shouldRetry(err, retryCount)) {
      return handler.next(err);
    }

    // Calculate delay with exponential backoff
    final delay = _calculateDelay(retryCount, err);

    // Wait before retrying
    await Future.delayed(delay);

    // Update retry count
    err.requestOptions.extra['_retryCount'] = retryCount + 1;

    try {
      // Retry the request
      final response = await dio.fetch(err.requestOptions);
      handler.resolve(response);
    } on DioException catch (e) {
      // If retry fails, pass to next handler (may retry again)
      handler.next(e);
    }
  }

  bool _shouldRetry(DioException err, int retryCount) {
    // Don't retry if max retries exceeded
    if (retryCount >= maxRetries) {
      return false;
    }

    // Don't retry cancelled requests
    if (err.type == DioExceptionType.cancel) {
      return false;
    }

    // Don't retry if marked as non-retryable
    if (err.requestOptions.extra['noRetry'] == true) {
      return false;
    }

    // Retry network errors
    if (_isNetworkError(err)) {
      return true;
    }

    // Retry specific status codes
    final statusCode = err.response?.statusCode;
    if (statusCode != null && retryableStatusCodes.contains(statusCode)) {
      return true;
    }

    return false;
  }

  bool _isNetworkError(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError;
  }

  Duration _calculateDelay(int retryCount, DioException err) {
    // Check for Retry-After header (rate limiting)
    final retryAfter = err.response?.headers.value('retry-after');
    if (retryAfter != null) {
      final seconds = int.tryParse(retryAfter);
      if (seconds != null) {
        return Duration(seconds: seconds);
      }
    }

    // Use exponential backoff with jitter
    if (useExponentialBackoff) {
      final exponentialDelay = retryDelay.inMilliseconds * pow(2, retryCount);
      // Add random jitter (0-25% of delay)
      final jitter = Random().nextDouble() * 0.25 * exponentialDelay;
      return Duration(milliseconds: (exponentialDelay + jitter).toInt());
    }

    return retryDelay;
  }
}
