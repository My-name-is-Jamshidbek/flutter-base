import 'package:app_template/core/env/env_config.dart';

/// Application configuration that can be accessed globally.
class AppConfig {
  static EnvConfig _config = EnvConfig.dev;

  /// Initialize the app configuration with the given environment.
  static void init(EnvConfig config) {
    _config = config;
  }

  /// Get the current environment configuration.
  static EnvConfig get config => _config;

  /// Convenience getters for common configuration values.
  static String get appName => _config.appName;
  static String get baseUrl => _config.baseUrl;
  static bool get enableLogging => _config.enableLogging;
  static Environment get environment => _config.environment;
}
