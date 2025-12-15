import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'env_config.g.dart';

/// Environment configuration for the app.
/// Defines different build environments (dev, staging, prod).
enum Environment { dev, staging, prod }

/// Environment configuration class that holds all environment-specific values.
class EnvConfig {
  final Environment environment;
  final String appName;
  final String baseUrl;
  final String apiVersion;
  final bool enableLogging;
  final int connectTimeout;
  final int receiveTimeout;
  final int sendTimeout;
  final int maxRetries;
  final bool enableCrashlytics;
  final bool enableAnalytics;

  const EnvConfig({
    required this.environment,
    required this.appName,
    required this.baseUrl,
    this.apiVersion = 'v1',
    required this.enableLogging,
    this.connectTimeout = 30,
    this.receiveTimeout = 30,
    this.sendTimeout = 30,
    this.maxRetries = 3,
    this.enableCrashlytics = false,
    this.enableAnalytics = false,
  });

  /// Development environment configuration.
  static const EnvConfig dev = EnvConfig(
    environment: Environment.dev,
    appName: 'App Template (Dev)',
    baseUrl: 'https://api.dev.example.com',
    enableLogging: true,
    enableCrashlytics: false,
    enableAnalytics: false,
  );

  /// Staging environment configuration.
  static const EnvConfig staging = EnvConfig(
    environment: Environment.staging,
    appName: 'App Template (Staging)',
    baseUrl: 'https://api.staging.example.com',
    enableLogging: true,
    enableCrashlytics: true,
    enableAnalytics: false,
  );

  /// Production environment configuration.
  static const EnvConfig prod = EnvConfig(
    environment: Environment.prod,
    appName: 'App Template',
    baseUrl: 'https://api.example.com',
    enableLogging: false,
    enableCrashlytics: true,
    enableAnalytics: true,
  );

  /// Current active configuration.
  static EnvConfig _current = dev;

  /// Get the current environment configuration.
  static EnvConfig get current => _current;

  /// Initialize the environment configuration.
  static void init(Environment env) {
    switch (env) {
      case Environment.dev:
        _current = dev;
      case Environment.staging:
        _current = staging;
      case Environment.prod:
        _current = prod;
    }
  }

  /// Initialize from compile-time constant.
  static void initFromEnvironment() {
    const envString = String.fromEnvironment(
      'ENVIRONMENT',
      defaultValue: 'dev',
    );

    switch (envString.toLowerCase()) {
      case 'production':
      case 'prod':
        _current = prod;
      case 'staging':
      case 'stage':
        _current = staging;
      default:
        _current = dev;
    }
  }

  bool get isDev => environment == Environment.dev;
  bool get isStaging => environment == Environment.staging;
  bool get isProd => environment == Environment.prod;

  /// Full API URL with version.
  String get apiUrl => '$baseUrl/$apiVersion';

  /// Connect timeout as Duration.
  Duration get connectTimeoutDuration => Duration(seconds: connectTimeout);

  /// Receive timeout as Duration.
  Duration get receiveTimeoutDuration => Duration(seconds: receiveTimeout);

  /// Send timeout as Duration.
  Duration get sendTimeoutDuration => Duration(seconds: sendTimeout);

  /// Get default headers for API requests.
  Map<String, String> get defaultHeaders => {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'X-Environment': environment.name,
  };

  @override
  String toString() {
    return 'EnvConfig('
        'environment: $environment, '
        'baseUrl: $baseUrl, '
        'enableLogging: $enableLogging'
        ')';
  }
}

/// Provides the current environment configuration.
@Riverpod(keepAlive: true)
EnvConfig envConfig(Ref ref) {
  return EnvConfig.current;
}

/// Provides the current environment.
@Riverpod(keepAlive: true)
Environment currentEnvironment(Ref ref) {
  return ref.watch(envConfigProvider).environment;
}

/// Provides whether logging is enabled.
@Riverpod(keepAlive: true)
bool isLoggingEnabled(Ref ref) {
  return ref.watch(envConfigProvider).enableLogging;
}
