import '../../core/network/api_client.dart';
import '../../core/network/failures.dart';
import '../../core/network/result.dart';

/// Base repository providing common API operations.
///
/// Repositories encapsulate data access logic and provide a clean API
/// for the domain layer. They handle:
/// - API calls with proper error handling
/// - Response transformation to domain entities
/// - Caching (can be extended)
/// - Offline support (can be extended)
///
/// Example usage:
/// ```dart
/// class UserRepository extends BaseRepository {
///   UserRepository(super.apiClient);
///
///   AsyncResult<User> getUser(String id) async {
///     return safeApiCall(
///       () => apiClient.get('/users/$id'),
///       (data) => User.fromJson(data),
///     );
///   }
/// }
/// ```
abstract class BaseRepository {
  const BaseRepository(this.apiClient);

  /// The API client for making HTTP requests.
  final ApiClient apiClient;

  /// Safely execute an API call with automatic error handling.
  ///
  /// Wraps the API call in a try-catch and maps errors to [Failure] types.
  /// The [fromJson] parameter transforms the response data to the desired type.
  ///
  /// Example:
  /// ```dart
  /// AsyncResult<User> getUser(String id) async {
  ///   return safeApiCall(
  ///     () => apiClient.get('/users/$id'),
  ///     (data) => User.fromJson(data),
  ///   );
  /// }
  /// ```
  Future<Result<T>> safeApiCall<T>(
    Future<dynamic> Function() apiCall,
    T Function(dynamic data) fromJson,
  ) async {
    try {
      final response = await apiCall();
      final result = fromJson(response);
      return Results.success(result);
    } on Failure catch (failure) {
      return Results.failure(failure);
    } catch (e, stackTrace) {
      return Results.failure(
        Failure.unknown(message: e.toString(), stackTrace: stackTrace),
      );
    }
  }

  /// Safely execute an API call that returns a list.
  Future<Result<List<T>>> safeApiCallList<T>(
    Future<dynamic> Function() apiCall,
    T Function(dynamic item) fromJson,
  ) async {
    return safeApiCall(apiCall, (data) {
      if (data is List) {
        return data.map((item) => fromJson(item)).toList();
      }
      // Handle wrapped responses like { "data": [...] }
      if (data is Map && data.containsKey('data')) {
        final list = data['data'] as List;
        return list.map((item) => fromJson(item)).toList();
      }
      return <T>[];
    });
  }

  /// Execute an API call that doesn't return data (e.g., DELETE).
  Future<Result<void>> safeApiCallVoid(
    Future<dynamic> Function() apiCall,
  ) async {
    try {
      await apiCall();
      return Results.success(null);
    } on Failure catch (failure) {
      return Results.failure(failure);
    } catch (e, stackTrace) {
      return Results.failure(
        Failure.unknown(message: e.toString(), stackTrace: stackTrace),
      );
    }
  }

  /// Combine multiple results into a single result.
  ///
  /// Returns a failure if any of the results is a failure,
  /// otherwise returns all success values as a list.
  Future<Result<List<T>>> combineResults<T>(
    List<Future<Result<T>>> futures,
  ) async {
    final results = await Future.wait(futures);
    final failures = <Failure>[];
    final successes = <T>[];

    for (final result in results) {
      result.fold(
        (failure) => failures.add(failure),
        (success) => successes.add(success),
      );
    }

    if (failures.isNotEmpty) {
      return Results.failure(failures.first);
    }

    return Results.success(successes);
  }

  /// Execute API call with retry logic.
  ///
  /// Retries the API call up to [maxRetries] times with exponential backoff.
  Future<Result<T>> safeApiCallWithRetry<T>(
    Future<dynamic> Function() apiCall,
    T Function(dynamic data) fromJson, {
    int maxRetries = 3,
    Duration initialDelay = const Duration(milliseconds: 500),
  }) async {
    var attempts = 0;
    var delay = initialDelay;

    while (true) {
      final result = await safeApiCall(apiCall, fromJson);

      // Return on success
      if (result.isRight()) {
        return result;
      }

      // Check if we should retry
      final failure = result.getLeft().toNullable();
      if (failure != null && failure.isRecoverable && attempts < maxRetries) {
        attempts++;
        await Future.delayed(delay);
        delay *= 2; // Exponential backoff
        continue;
      }

      // Return failure
      return result;
    }
  }
}

/// Extension to provide convenient data field extraction.
extension MapDataExtraction on Map<String, dynamic> {
  /// Extract the 'data' field or return self.
  dynamic get dataField => containsKey('data') ? this['data'] : this;

  /// Extract paginated data.
  Map<String, dynamic> get paginatedData => {
    'data': this['data'] ?? [],
    'meta': this['meta'] ?? {},
    'pagination': this['pagination'] ?? this['meta']?['pagination'] ?? {},
  };
}
