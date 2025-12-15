// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$httpClientHash() => r'3157fa8af6d722cbc9e7b8866a9669deecdc9b9b';

/// Provider for the API client.
///
/// Copied from [httpClient].
@ProviderFor(httpClient)
final httpClientProvider = AutoDisposeProvider<ApiClient>.internal(
  httpClient,
  name: r'httpClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$httpClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HttpClientRef = AutoDisposeProviderRef<ApiClient>;
String _$dioInstanceHash() => r'0456c6625cf7fa71483594d0de8f5f8752d5415d';

/// Provider for the raw Dio instance (for advanced usage).
///
/// Copied from [dioInstance].
@ProviderFor(dioInstance)
final dioInstanceProvider = AutoDisposeProvider<Dio>.internal(
  dioInstance,
  name: r'dioInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dioInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioInstanceRef = AutoDisposeProviderRef<Dio>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
