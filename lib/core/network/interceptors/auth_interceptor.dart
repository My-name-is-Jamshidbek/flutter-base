import 'dart:async';
import 'package:dio/dio.dart';

/// Type definition for providing auth tokens.
typedef AuthTokenProvider = FutureOr<String?> Function();

/// Type definition for handling token refresh.
typedef TokenRefreshHandler =
    Future<String?> Function(Dio dio, DioException error);

/// Interceptor for injecting authentication tokens into requests.
///
/// Automatically adds the Authorization header with Bearer token
/// and handles token refresh on 401 errors.
class AuthInterceptor extends Interceptor {
  final AuthTokenProvider tokenProvider;
  final TokenRefreshHandler? refreshHandler;

  /// Lock to prevent multiple simultaneous refresh attempts.
  bool _isRefreshing = false;

  /// Queue of requests waiting for token refresh.
  final List<({RequestOptions options, ErrorInterceptorHandler handler})>
  _pendingRequests = [];

  AuthInterceptor({required this.tokenProvider, this.refreshHandler});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip if already has authorization header
    if (options.headers.containsKey('Authorization')) {
      return handler.next(options);
    }

    // Skip if marked as no-auth
    if (options.extra['noAuth'] == true) {
      return handler.next(options);
    }

    try {
      final token = await tokenProvider();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      // Log error but don't fail the request
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Only handle 401 Unauthorized
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // Skip if no refresh handler
    if (refreshHandler == null) {
      return handler.next(err);
    }

    // Skip if already tried refreshing for this request
    if (err.requestOptions.extra['_retried'] == true) {
      return handler.next(err);
    }

    // If already refreshing, queue this request
    if (_isRefreshing) {
      _pendingRequests.add((options: err.requestOptions, handler: handler));
      return;
    }

    _isRefreshing = true;

    try {
      // Get the Dio instance from request options
      final dio = Dio(
        BaseOptions(
          baseUrl: err.requestOptions.baseUrl,
          headers: err.requestOptions.headers,
        ),
      );

      // Attempt to refresh token
      final newToken = await refreshHandler!(dio, err);

      if (newToken != null) {
        // Retry the original request with new token
        final retryOptions = err.requestOptions;
        retryOptions.headers['Authorization'] = 'Bearer $newToken';
        retryOptions.extra['_retried'] = true;

        final response = await dio.fetch(retryOptions);
        handler.resolve(response);

        // Retry all pending requests
        for (final pending in _pendingRequests) {
          pending.options.headers['Authorization'] = 'Bearer $newToken';
          pending.options.extra['_retried'] = true;
          try {
            final response = await dio.fetch(pending.options);
            pending.handler.resolve(response);
          } catch (e) {
            if (e is DioException) {
              pending.handler.reject(e);
            }
          }
        }
      } else {
        // Token refresh failed, reject all requests
        handler.next(err);
        for (final pending in _pendingRequests) {
          pending.handler.reject(err);
        }
      }
    } catch (e) {
      // Refresh failed, reject all requests
      handler.next(err);
      for (final pending in _pendingRequests) {
        pending.handler.reject(err);
      }
    } finally {
      _isRefreshing = false;
      _pendingRequests.clear();
    }
  }
}
