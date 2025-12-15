import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app_template/core/env/env_config.dart';
import 'package:app_template/core/network/interceptors/auth_interceptor.dart';
import 'package:app_template/core/network/interceptors/logging_interceptor.dart';
import 'package:app_template/core/network/interceptors/retry_interceptor.dart';
import 'package:app_template/core/network/interceptors/error_interceptor.dart';

part 'api_client.g.dart';

/// API client configuration options.
class ApiClientOptions {
  /// Base URL for all API requests.
  final String baseUrl;

  /// Connection timeout duration.
  final Duration connectTimeout;

  /// Receive timeout duration.
  final Duration receiveTimeout;

  /// Send timeout duration.
  final Duration sendTimeout;

  /// Default headers for all requests.
  final Map<String, String> headers;

  /// Whether to enable logging (disabled in production).
  final bool enableLogging;

  /// Maximum retry attempts for failed requests.
  final int maxRetries;

  /// Retry delay between attempts.
  final Duration retryDelay;

  const ApiClientOptions({
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
    this.sendTimeout = const Duration(seconds: 30),
    this.headers = const {},
    this.enableLogging = true,
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
  });

  /// Create options from environment configuration.
  factory ApiClientOptions.fromEnv(EnvConfig env) {
    return ApiClientOptions(
      baseUrl: env.baseUrl,
      connectTimeout: env.connectTimeoutDuration,
      receiveTimeout: env.receiveTimeoutDuration,
      sendTimeout: env.sendTimeoutDuration,
      enableLogging: env.enableLogging,
      maxRetries: env.maxRetries,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        ...env.defaultHeaders,
      },
    );
  }
}

/// HTTP client service using Dio.
///
/// Provides a configured Dio instance with:
/// - Base options (URL, timeouts, headers)
/// - Auth token injection
/// - Logging (dev only)
/// - Retry with exponential backoff
/// - Error mapping to app-level failures
class ApiClient {
  final Dio _dio;
  final ApiClientOptions options;

  ApiClient._({required Dio dio, required this.options}) : _dio = dio;

  /// Create a new API client with the given options.
  factory ApiClient({
    required ApiClientOptions options,
    AuthTokenProvider? tokenProvider,
    TokenRefreshHandler? refreshHandler,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: options.baseUrl,
        connectTimeout: options.connectTimeout,
        receiveTimeout: options.receiveTimeout,
        sendTimeout: options.sendTimeout,
        headers: options.headers,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    // Add interceptors in order
    // 1. Error interceptor (first to catch errors)
    dio.interceptors.add(ErrorInterceptor());

    // 2. Auth interceptor (inject tokens)
    if (tokenProvider != null) {
      dio.interceptors.add(
        AuthInterceptor(
          tokenProvider: tokenProvider,
          refreshHandler: refreshHandler,
        ),
      );
    }

    // 3. Retry interceptor (retry failed requests)
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        maxRetries: options.maxRetries,
        retryDelay: options.retryDelay,
      ),
    );

    // 4. Logging interceptor (last, only in dev)
    if (options.enableLogging) {
      dio.interceptors.add(AppLoggingInterceptor());
    }

    return ApiClient._(dio: dio, options: options);
  }

  /// The underlying Dio instance for advanced usage.
  Dio get dio => _dio;

  /// Perform a GET request.
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// Perform a POST request.
  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// Perform a PUT request.
  Future<Response<T>> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// Perform a PATCH request.
  Future<Response<T>> patch<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// Perform a DELETE request.
  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// Download a file.
  Future<Response> download(
    String urlPath,
    String savePath, {
    void Function(int, int)? onReceiveProgress,
    CancelToken? cancelToken,
  }) {
    return _dio.download(
      urlPath,
      savePath,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );
  }

  /// Upload a file with multipart form data.
  Future<Response<T>> upload<T>(
    String path, {
    required FormData formData,
    void Function(int, int)? onSendProgress,
    CancelToken? cancelToken,
  }) {
    return _dio.post<T>(
      path,
      data: formData,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    );
  }
}

/// Provider for the API client.
@riverpod
ApiClient httpClient(Ref ref) {
  final env = ref.watch(envConfigProvider);

  return ApiClient(
    options: ApiClientOptions.fromEnv(env),
    // Token provider will be added when auth is implemented
    // tokenProvider: () => ref.read(authTokenProvider),
    // refreshHandler: (dio, error) => ref.read(authServiceProvider).refreshToken(),
  );
}

/// Provider for the raw Dio instance (for advanced usage).
@riverpod
Dio dioInstance(Ref ref) {
  return ref.watch(httpClientProvider).dio;
}
