// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl<T> _$$ApiResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$ApiResponseImpl<T>(
  data: fromJsonT(json['data']),
  success: json['success'] as bool? ?? true,
  message: json['message'] as String?,
  meta: json['meta'] == null
      ? null
      : ApiMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ApiResponseImplToJson<T>(
  _$ApiResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': toJsonT(instance.data),
  'success': instance.success,
  'message': instance.message,
  'meta': instance.meta,
};

_$PaginatedResponseImpl<T> _$$PaginatedResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$PaginatedResponseImpl<T>(
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  pagination: PaginationMeta.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
  success: json['success'] as bool? ?? true,
  message: json['message'] as String?,
);

Map<String, dynamic> _$$PaginatedResponseImplToJson<T>(
  _$PaginatedResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'pagination': instance.pagination,
  'success': instance.success,
  'message': instance.message,
};

_$ApiMetaImpl _$$ApiMetaImplFromJson(Map<String, dynamic> json) =>
    _$ApiMetaImpl(
      requestId: json['requestId'] as String?,
      timestamp: (json['timestamp'] as num?)?.toInt(),
      version: json['version'] as String?,
      extra: json['extra'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ApiMetaImplToJson(_$ApiMetaImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'timestamp': instance.timestamp,
      'version': instance.version,
      'extra': instance.extra,
    };

_$PaginationMetaImpl _$$PaginationMetaImplFromJson(Map<String, dynamic> json) =>
    _$PaginationMetaImpl(
      page: (json['page'] as num).toInt(),
      perPage: (json['perPage'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasMore: json['hasMore'] as bool? ?? false,
    );

Map<String, dynamic> _$$PaginationMetaImplToJson(
  _$PaginationMetaImpl instance,
) => <String, dynamic>{
  'page': instance.page,
  'perPage': instance.perPage,
  'total': instance.total,
  'totalPages': instance.totalPages,
  'hasMore': instance.hasMore,
};

_$ApiErrorImpl _$$ApiErrorImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorImpl(
      message: json['message'] as String,
      code: json['code'] as String?,
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ApiErrorImplToJson(_$ApiErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
    };
