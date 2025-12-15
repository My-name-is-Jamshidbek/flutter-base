import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// Generic API response wrapper.
///
/// Handles common API response patterns with data, pagination, and metadata.
@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required T data,
    @Default(true) bool success,
    String? message,
    ApiMeta? meta,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);
}

/// Paginated API response wrapper.
@Freezed(genericArgumentFactories: true)
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    required List<T> data,
    required PaginationMeta pagination,
    @Default(true) bool success,
    String? message,
  }) = _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginatedResponseFromJson(json, fromJsonT);
}

/// API metadata.
@freezed
class ApiMeta with _$ApiMeta {
  const factory ApiMeta({
    String? requestId,
    int? timestamp,
    String? version,
    Map<String, dynamic>? extra,
  }) = _ApiMeta;

  factory ApiMeta.fromJson(Map<String, dynamic> json) =>
      _$ApiMetaFromJson(json);
}

/// Pagination metadata.
@freezed
class PaginationMeta with _$PaginationMeta {
  const PaginationMeta._();

  const factory PaginationMeta({
    required int page,
    required int perPage,
    required int total,
    required int totalPages,
    @Default(false) bool hasMore,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);

  /// Whether there is a next page.
  bool get hasNextPage => page < totalPages;

  /// Whether there is a previous page.
  bool get hasPreviousPage => page > 1;

  /// The offset for the current page.
  int get offset => (page - 1) * perPage;
}

/// API error response.
@freezed
class ApiError with _$ApiError {
  const factory ApiError({
    required String message,
    String? code,
    Map<String, List<String>>? errors,
    int? statusCode,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
