import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/app.dart';
import 'package:app_template/core/config/app_config.dart';
import 'package:app_template/core/env/env_config.dart';
import 'package:app_template/core/di/providers.dart';
import 'package:app_template/core/logging/app_logger.dart';

/// Application entry point.
///
/// This is where the app is initialized with:
/// - Environment configuration
/// - Dependency injection setup
/// - Riverpod provider scope
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize environment configuration
  // Change to EnvConfig.staging or EnvConfig.prod for different environments
  AppConfig.init(EnvConfig.dev);

  // Initialize dependency injection
  final container = await createProviderContainer();

  logger.info('App starting in ${AppConfig.environment.name} mode');

  runApp(UncontrolledProviderScope(container: container, child: const App()));
}
