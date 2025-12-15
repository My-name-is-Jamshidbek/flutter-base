// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_config.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$envConfigHash() => r'57db0a7b956df3a1f268813fab982f70df6c8b62';

/// Provides the current environment configuration.
///
/// Copied from [envConfig].
@ProviderFor(envConfig)
final envConfigProvider = Provider<EnvConfig>.internal(
  envConfig,
  name: r'envConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$envConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EnvConfigRef = ProviderRef<EnvConfig>;
String _$currentEnvironmentHash() =>
    r'b24a08481fd32569e939affb9ee74b0836f5d45c';

/// Provides the current environment.
///
/// Copied from [currentEnvironment].
@ProviderFor(currentEnvironment)
final currentEnvironmentProvider = Provider<Environment>.internal(
  currentEnvironment,
  name: r'currentEnvironmentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentEnvironmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentEnvironmentRef = ProviderRef<Environment>;
String _$isLoggingEnabledHash() => r'2ce5b51b0107801fa33ec5d53b8ff730fb811747';

/// Provides whether logging is enabled.
///
/// Copied from [isLoggingEnabled].
@ProviderFor(isLoggingEnabled)
final isLoggingEnabledProvider = Provider<bool>.internal(
  isLoggingEnabled,
  name: r'isLoggingEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isLoggingEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsLoggingEnabledRef = ProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
