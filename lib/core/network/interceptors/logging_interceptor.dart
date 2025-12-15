import 'dart:developer' as developer;
import 'package:dio/dio.dart';

// Logger level enum for categorizing log output
enum _LogLevel { debug, info, warning, error }

/// Logging interceptor for debugging HTTP requests and responses.
///
/// Logs request/response details in development mode only.
/// Uses dart:developer for IDE integration.
class AppLoggingInterceptor extends Interceptor {
  final bool logRequestHeaders;
  final bool logResponseHeaders;
  final bool logRequestBody;
  final bool logResponseBody;

  AppLoggingInterceptor({
    this.logRequestHeaders = false,
    this.logResponseHeaders = false,
    this.logRequestBody = true,
    this.logResponseBody = true,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final buffer = StringBuffer();
    buffer.writeln('┌─────────────────────────────────────────────────────');
    buffer.writeln('│ 🌐 REQUEST: ${options.method} ${options.uri}');
    buffer.writeln('├─────────────────────────────────────────────────────');

    if (logRequestHeaders && options.headers.isNotEmpty) {
      buffer.writeln('│ Headers:');
      options.headers.forEach((key, value) {
        // Mask sensitive headers
        final displayValue = _maskSensitiveHeader(key, value.toString());
        buffer.writeln('│   $key: $displayValue');
      });
    }

    if (logRequestBody && options.data != null) {
      buffer.writeln('│ Body: ${_truncateBody(options.data.toString())}');
    }

    if (options.queryParameters.isNotEmpty) {
      buffer.writeln('│ Query: ${options.queryParameters}');
    }

    buffer.writeln('└─────────────────────────────────────────────────────');

    _log(buffer.toString(), level: _LogLevel.debug);

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final buffer = StringBuffer();
    final statusEmoji = _getStatusEmoji(response.statusCode ?? 0);

    buffer.writeln('┌─────────────────────────────────────────────────────');
    buffer.writeln(
      '│ $statusEmoji RESPONSE: ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}',
    );
    buffer.writeln('├─────────────────────────────────────────────────────');

    if (logResponseHeaders && response.headers.map.isNotEmpty) {
      buffer.writeln('│ Headers:');
      response.headers.forEach((name, values) {
        buffer.writeln('│   $name: ${values.join(', ')}');
      });
    }

    if (logResponseBody && response.data != null) {
      buffer.writeln('│ Body: ${_truncateBody(response.data.toString())}');
    }

    buffer.writeln('└─────────────────────────────────────────────────────');

    _log(buffer.toString(), level: _LogLevel.debug);

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final buffer = StringBuffer();
    buffer.writeln('┌─────────────────────────────────────────────────────');
    buffer.writeln(
      '│ ❌ ERROR: ${err.type.name} ${err.requestOptions.method} ${err.requestOptions.uri}',
    );
    buffer.writeln('├─────────────────────────────────────────────────────');
    buffer.writeln('│ Message: ${err.message}');

    if (err.response != null) {
      buffer.writeln('│ Status: ${err.response?.statusCode}');
      if (logResponseBody && err.response?.data != null) {
        buffer.writeln(
          '│ Body: ${_truncateBody(err.response?.data.toString() ?? '')}',
        );
      }
    }

    buffer.writeln('└─────────────────────────────────────────────────────');

    _log(buffer.toString(), level: _LogLevel.error);

    handler.next(err);
  }

  void _log(String message, {_LogLevel level = _LogLevel.info}) {
    // Use developer.log for better IDE integration
    developer.log(message, name: 'HTTP', level: _levelToInt(level));
  }

  int _levelToInt(_LogLevel level) {
    switch (level) {
      case _LogLevel.debug:
        return 500;
      case _LogLevel.info:
        return 800;
      case _LogLevel.warning:
        return 900;
      case _LogLevel.error:
        return 1000;
    }
  }

  String _getStatusEmoji(int statusCode) {
    if (statusCode >= 200 && statusCode < 300) return '✅';
    if (statusCode >= 300 && statusCode < 400) return '↪️';
    if (statusCode >= 400 && statusCode < 500) return '⚠️';
    if (statusCode >= 500) return '🔥';
    return '❓';
  }

  String _maskSensitiveHeader(String key, String value) {
    final sensitiveHeaders = ['authorization', 'cookie', 'x-api-key'];
    if (sensitiveHeaders.contains(key.toLowerCase())) {
      if (value.length > 10) {
        return '${value.substring(0, 10)}...***';
      }
      return '***';
    }
    return value;
  }

  String _truncateBody(String body, {int maxLength = 500}) {
    if (body.length <= maxLength) return body;
    return '${body.substring(0, maxLength)}... [truncated]';
  }
}
