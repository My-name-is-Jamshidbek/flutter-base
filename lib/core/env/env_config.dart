/// Environment configuration for the app.
/// Defines different build environments (dev, staging, prod).
enum Environment { dev, staging, prod }

/// Environment configuration class that holds all environment-specific values.
class EnvConfig {
  final Environment environment;
  final String appName;
  final String baseUrl;
  final bool enableLogging;

  const EnvConfig({
    required this.environment,
    required this.appName,
    required this.baseUrl,
    required this.enableLogging,
  });

  /// Development environment configuration.
  static const EnvConfig dev = EnvConfig(
    environment: Environment.dev,
    appName: 'App Template (Dev)',
    baseUrl: 'https://api.dev.example.com',
    enableLogging: true,
  );

  /// Staging environment configuration.
  static const EnvConfig staging = EnvConfig(
    environment: Environment.staging,
    appName: 'App Template (Staging)',
    baseUrl: 'https://api.staging.example.com',
    enableLogging: true,
  );

  /// Production environment configuration.
  static const EnvConfig prod = EnvConfig(
    environment: Environment.prod,
    appName: 'App Template',
    baseUrl: 'https://api.example.com',
    enableLogging: false,
  );

  bool get isDev => environment == Environment.dev;
  bool get isStaging => environment == Environment.staging;
  bool get isProd => environment == Environment.prod;
}
