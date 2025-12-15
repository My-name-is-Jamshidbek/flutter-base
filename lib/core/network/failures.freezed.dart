// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )
    network,
    required TResult Function(
      String message,
      int? statusCode,
      String? serverMessage,
    )
    server,
    required TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )
    auth,
    required TResult Function(
      String message,
      Map<String, List<String>>? fieldErrors,
    )
    validation,
    required TResult Function(String message, String? resource) notFound,
    required TResult Function(String message, Duration? retryAfter) rateLimit,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) cache,
    required TResult Function(
      String message,
      Object? error,
      StackTrace? stackTrace,
    )
    unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult? Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult? Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult? Function(String message, String? resource)? notFound,
    TResult? Function(String message, Duration? retryAfter)? rateLimit,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult Function(String message, String? resource)? notFound,
    TResult Function(String message, Duration? retryAfter)? rateLimit,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(RateLimitFailure value) rateLimit,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(RateLimitFailure value)? rateLimit,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(RateLimitFailure value)? rateLimit,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(
    _$NetworkFailureImpl value,
    $Res Function(_$NetworkFailureImpl) then,
  ) = __$$NetworkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    int? statusCode,
    bool isTimeout,
    bool isConnectionError,
  });
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
    _$NetworkFailureImpl _value,
    $Res Function(_$NetworkFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = freezed,
    Object? isTimeout = null,
    Object? isConnectionError = null,
  }) {
    return _then(
      _$NetworkFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        statusCode: freezed == statusCode
            ? _value.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        isTimeout: null == isTimeout
            ? _value.isTimeout
            : isTimeout // ignore: cast_nullable_to_non_nullable
                  as bool,
        isConnectionError: null == isConnectionError
            ? _value.isConnectionError
            : isConnectionError // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$NetworkFailureImpl extends NetworkFailure {
  const _$NetworkFailureImpl({
    required this.message,
    this.statusCode,
    this.isTimeout = false,
    this.isConnectionError = false,
  }) : super._();

  @override
  final String message;
  @override
  final int? statusCode;
  @override
  @JsonKey()
  final bool isTimeout;
  @override
  @JsonKey()
  final bool isConnectionError;

  @override
  String toString() {
    return 'Failure.network(message: $message, statusCode: $statusCode, isTimeout: $isTimeout, isConnectionError: $isConnectionError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.isTimeout, isTimeout) ||
                other.isTimeout == isTimeout) &&
            (identical(other.isConnectionError, isConnectionError) ||
                other.isConnectionError == isConnectionError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    statusCode,
    isTimeout,
    isConnectionError,
  );

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )
    network,
    required TResult Function(
      String message,
      int? statusCode,
      String? serverMessage,
    )
    server,
    required TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )
    auth,
    required TResult Function(
      String message,
      Map<String, List<String>>? fieldErrors,
    )
    validation,
    required TResult Function(String message, String? resource) notFound,
    required TResult Function(String message, Duration? retryAfter) rateLimit,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) cache,
    required TResult Function(
      String message,
      Object? error,
      StackTrace? stackTrace,
    )
    unknown,
  }) {
    return network(message, statusCode, isTimeout, isConnectionError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult? Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult? Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult? Function(String message, String? resource)? notFound,
    TResult? Function(String message, Duration? retryAfter)? rateLimit,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
  }) {
    return network?.call(message, statusCode, isTimeout, isConnectionError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult Function(String message, String? resource)? notFound,
    TResult Function(String message, Duration? retryAfter)? rateLimit,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message, statusCode, isTimeout, isConnectionError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(RateLimitFailure value) rateLimit,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(RateLimitFailure value)? rateLimit,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(RateLimitFailure value)? rateLimit,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure extends Failure {
  const factory NetworkFailure({
    required final String message,
    final int? statusCode,
    final bool isTimeout,
    final bool isConnectionError,
  }) = _$NetworkFailureImpl;
  const NetworkFailure._() : super._();

  @override
  String get message;
  int? get statusCode;
  bool get isTimeout;
  bool get isConnectionError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
    _$ServerFailureImpl value,
    $Res Function(_$ServerFailureImpl) then,
  ) = __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int? statusCode, String? serverMessage});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
    _$ServerFailureImpl _value,
    $Res Function(_$ServerFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = freezed,
    Object? serverMessage = freezed,
  }) {
    return _then(
      _$ServerFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        statusCode: freezed == statusCode
            ? _value.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        serverMessage: freezed == serverMessage
            ? _value.serverMessage
            : serverMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ServerFailureImpl extends ServerFailure {
  const _$ServerFailureImpl({
    required this.message,
    this.statusCode,
    this.serverMessage,
  }) : super._();

  @override
  final String message;
  @override
  final int? statusCode;
  @override
  final String? serverMessage;

  @override
  String toString() {
    return 'Failure.server(message: $message, statusCode: $statusCode, serverMessage: $serverMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.serverMessage, serverMessage) ||
                other.serverMessage == serverMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, statusCode, serverMessage);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )
    network,
    required TResult Function(
      String message,
      int? statusCode,
      String? serverMessage,
    )
    server,
    required TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )
    auth,
    required TResult Function(
      String message,
      Map<String, List<String>>? fieldErrors,
    )
    validation,
    required TResult Function(String message, String? resource) notFound,
    required TResult Function(String message, Duration? retryAfter) rateLimit,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) cache,
    required TResult Function(
      String message,
      Object? error,
      StackTrace? stackTrace,
    )
    unknown,
  }) {
    return server(message, statusCode, serverMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult? Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult? Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult? Function(String message, String? resource)? notFound,
    TResult? Function(String message, Duration? retryAfter)? rateLimit,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
  }) {
    return server?.call(message, statusCode, serverMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult Function(String message, String? resource)? notFound,
    TResult Function(String message, Duration? retryAfter)? rateLimit,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message, statusCode, serverMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(RateLimitFailure value) rateLimit,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(RateLimitFailure value)? rateLimit,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(RateLimitFailure value)? rateLimit,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerFailure extends Failure {
  const factory ServerFailure({
    required final String message,
    final int? statusCode,
    final String? serverMessage,
  }) = _$ServerFailureImpl;
  const ServerFailure._() : super._();

  @override
  String get message;
  int? get statusCode;
  String? get serverMessage;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
    _$AuthFailureImpl value,
    $Res Function(_$AuthFailureImpl) then,
  ) = __$$AuthFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    bool isTokenExpired,
    bool isUnauthorized,
    bool isForbidden,
  });
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
    _$AuthFailureImpl _value,
    $Res Function(_$AuthFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isTokenExpired = null,
    Object? isUnauthorized = null,
    Object? isForbidden = null,
  }) {
    return _then(
      _$AuthFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        isTokenExpired: null == isTokenExpired
            ? _value.isTokenExpired
            : isTokenExpired // ignore: cast_nullable_to_non_nullable
                  as bool,
        isUnauthorized: null == isUnauthorized
            ? _value.isUnauthorized
            : isUnauthorized // ignore: cast_nullable_to_non_nullable
                  as bool,
        isForbidden: null == isForbidden
            ? _value.isForbidden
            : isForbidden // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$AuthFailureImpl extends AuthFailure {
  const _$AuthFailureImpl({
    required this.message,
    this.isTokenExpired = false,
    this.isUnauthorized = false,
    this.isForbidden = false,
  }) : super._();

  @override
  final String message;
  @override
  @JsonKey()
  final bool isTokenExpired;
  @override
  @JsonKey()
  final bool isUnauthorized;
  @override
  @JsonKey()
  final bool isForbidden;

  @override
  String toString() {
    return 'Failure.auth(message: $message, isTokenExpired: $isTokenExpired, isUnauthorized: $isUnauthorized, isForbidden: $isForbidden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isTokenExpired, isTokenExpired) ||
                other.isTokenExpired == isTokenExpired) &&
            (identical(other.isUnauthorized, isUnauthorized) ||
                other.isUnauthorized == isUnauthorized) &&
            (identical(other.isForbidden, isForbidden) ||
                other.isForbidden == isForbidden));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    isTokenExpired,
    isUnauthorized,
    isForbidden,
  );

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      __$$AuthFailureImplCopyWithImpl<_$AuthFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )
    network,
    required TResult Function(
      String message,
      int? statusCode,
      String? serverMessage,
    )
    server,
    required TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )
    auth,
    required TResult Function(
      String message,
      Map<String, List<String>>? fieldErrors,
    )
    validation,
    required TResult Function(String message, String? resource) notFound,
    required TResult Function(String message, Duration? retryAfter) rateLimit,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) cache,
    required TResult Function(
      String message,
      Object? error,
      StackTrace? stackTrace,
    )
    unknown,
  }) {
    return auth(message, isTokenExpired, isUnauthorized, isForbidden);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult? Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult? Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult? Function(String message, String? resource)? notFound,
    TResult? Function(String message, Duration? retryAfter)? rateLimit,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
  }) {
    return auth?.call(message, isTokenExpired, isUnauthorized, isForbidden);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult Function(String message, String? resource)? notFound,
    TResult Function(String message, Duration? retryAfter)? rateLimit,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(message, isTokenExpired, isUnauthorized, isForbidden);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(RateLimitFailure value) rateLimit,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(RateLimitFailure value)? rateLimit,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(RateLimitFailure value)? rateLimit,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class AuthFailure extends Failure {
  const factory AuthFailure({
    required final String message,
    final bool isTokenExpired,
    final bool isUnauthorized,
    final bool isForbidden,
  }) = _$AuthFailureImpl;
  const AuthFailure._() : super._();

  @override
  String get message;
  bool get isTokenExpired;
  bool get isUnauthorized;
  bool get isForbidden;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ValidationFailureImplCopyWith(
    _$ValidationFailureImpl value,
    $Res Function(_$ValidationFailureImpl) then,
  ) = __$$ValidationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Map<String, List<String>>? fieldErrors});
}

/// @nodoc
class __$$ValidationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ValidationFailureImpl>
    implements _$$ValidationFailureImplCopyWith<$Res> {
  __$$ValidationFailureImplCopyWithImpl(
    _$ValidationFailureImpl _value,
    $Res Function(_$ValidationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? fieldErrors = freezed}) {
    return _then(
      _$ValidationFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        fieldErrors: freezed == fieldErrors
            ? _value._fieldErrors
            : fieldErrors // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<String>>?,
      ),
    );
  }
}

/// @nodoc

class _$ValidationFailureImpl extends ValidationFailure {
  const _$ValidationFailureImpl({
    required this.message,
    final Map<String, List<String>>? fieldErrors,
  }) : _fieldErrors = fieldErrors,
       super._();

  @override
  final String message;
  final Map<String, List<String>>? _fieldErrors;
  @override
  Map<String, List<String>>? get fieldErrors {
    final value = _fieldErrors;
    if (value == null) return null;
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Failure.validation(message: $message, fieldErrors: $fieldErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._fieldErrors,
              _fieldErrors,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(_fieldErrors),
  );

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      __$$ValidationFailureImplCopyWithImpl<_$ValidationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )
    network,
    required TResult Function(
      String message,
      int? statusCode,
      String? serverMessage,
    )
    server,
    required TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )
    auth,
    required TResult Function(
      String message,
      Map<String, List<String>>? fieldErrors,
    )
    validation,
    required TResult Function(String message, String? resource) notFound,
    required TResult Function(String message, Duration? retryAfter) rateLimit,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) cache,
    required TResult Function(
      String message,
      Object? error,
      StackTrace? stackTrace,
    )
    unknown,
  }) {
    return validation(message, fieldErrors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult? Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult? Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult? Function(String message, String? resource)? notFound,
    TResult? Function(String message, Duration? retryAfter)? rateLimit,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
  }) {
    return validation?.call(message, fieldErrors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult Function(String message, String? resource)? notFound,
    TResult Function(String message, Duration? retryAfter)? rateLimit,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, fieldErrors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(RateLimitFailure value) rateLimit,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(RateLimitFailure value)? rateLimit,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(RateLimitFailure value)? rateLimit,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationFailure extends Failure {
  const factory ValidationFailure({
    required final String message,
    final Map<String, List<String>>? fieldErrors,
  }) = _$ValidationFailureImpl;
  const ValidationFailure._() : super._();

  @override
  String get message;
  Map<String, List<String>>? get fieldErrors;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NotFoundFailureImplCopyWith(
    _$NotFoundFailureImpl value,
    $Res Function(_$NotFoundFailureImpl) then,
  ) = __$$NotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? resource});
}

/// @nodoc
class __$$NotFoundFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundFailureImpl>
    implements _$$NotFoundFailureImplCopyWith<$Res> {
  __$$NotFoundFailureImplCopyWithImpl(
    _$NotFoundFailureImpl _value,
    $Res Function(_$NotFoundFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? resource = freezed}) {
    return _then(
      _$NotFoundFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        resource: freezed == resource
            ? _value.resource
            : resource // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$NotFoundFailureImpl extends NotFoundFailure {
  const _$NotFoundFailureImpl({required this.message, this.resource})
    : super._();

  @override
  final String message;
  @override
  final String? resource;

  @override
  String toString() {
    return 'Failure.notFound(message: $message, resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, resource);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      __$$NotFoundFailureImplCopyWithImpl<_$NotFoundFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )
    network,
    required TResult Function(
      String message,
      int? statusCode,
      String? serverMessage,
    )
    server,
    required TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )
    auth,
    required TResult Function(
      String message,
      Map<String, List<String>>? fieldErrors,
    )
    validation,
    required TResult Function(String message, String? resource) notFound,
    required TResult Function(String message, Duration? retryAfter) rateLimit,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) cache,
    required TResult Function(
      String message,
      Object? error,
      StackTrace? stackTrace,
    )
    unknown,
  }) {
    return notFound(message, resource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult? Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult? Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult? Function(String message, String? resource)? notFound,
    TResult? Function(String message, Duration? retryAfter)? rateLimit,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
  }) {
    return notFound?.call(message, resource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult Function(String message, String? resource)? notFound,
    TResult Function(String message, Duration? retryAfter)? rateLimit,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message, resource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(RateLimitFailure value) rateLimit,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(RateLimitFailure value)? rateLimit,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(RateLimitFailure value)? rateLimit,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundFailure extends Failure {
  const factory NotFoundFailure({
    required final String message,
    final String? resource,
  }) = _$NotFoundFailureImpl;
  const NotFoundFailure._() : super._();

  @override
  String get message;
  String? get resource;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RateLimitFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$RateLimitFailureImplCopyWith(
    _$RateLimitFailureImpl value,
    $Res Function(_$RateLimitFailureImpl) then,
  ) = __$$RateLimitFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Duration? retryAfter});
}

/// @nodoc
class __$$RateLimitFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$RateLimitFailureImpl>
    implements _$$RateLimitFailureImplCopyWith<$Res> {
  __$$RateLimitFailureImplCopyWithImpl(
    _$RateLimitFailureImpl _value,
    $Res Function(_$RateLimitFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? retryAfter = freezed}) {
    return _then(
      _$RateLimitFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        retryAfter: freezed == retryAfter
            ? _value.retryAfter
            : retryAfter // ignore: cast_nullable_to_non_nullable
                  as Duration?,
      ),
    );
  }
}

/// @nodoc

class _$RateLimitFailureImpl extends RateLimitFailure {
  const _$RateLimitFailureImpl({required this.message, this.retryAfter})
    : super._();

  @override
  final String message;
  @override
  final Duration? retryAfter;

  @override
  String toString() {
    return 'Failure.rateLimit(message: $message, retryAfter: $retryAfter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateLimitFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, retryAfter);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RateLimitFailureImplCopyWith<_$RateLimitFailureImpl> get copyWith =>
      __$$RateLimitFailureImplCopyWithImpl<_$RateLimitFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )
    network,
    required TResult Function(
      String message,
      int? statusCode,
      String? serverMessage,
    )
    server,
    required TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )
    auth,
    required TResult Function(
      String message,
      Map<String, List<String>>? fieldErrors,
    )
    validation,
    required TResult Function(String message, String? resource) notFound,
    required TResult Function(String message, Duration? retryAfter) rateLimit,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) cache,
    required TResult Function(
      String message,
      Object? error,
      StackTrace? stackTrace,
    )
    unknown,
  }) {
    return rateLimit(message, retryAfter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult? Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult? Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult? Function(String message, String? resource)? notFound,
    TResult? Function(String message, Duration? retryAfter)? rateLimit,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
  }) {
    return rateLimit?.call(message, retryAfter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult Function(String message, String? resource)? notFound,
    TResult Function(String message, Duration? retryAfter)? rateLimit,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
    required TResult orElse(),
  }) {
    if (rateLimit != null) {
      return rateLimit(message, retryAfter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(RateLimitFailure value) rateLimit,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return rateLimit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(RateLimitFailure value)? rateLimit,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return rateLimit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(RateLimitFailure value)? rateLimit,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (rateLimit != null) {
      return rateLimit(this);
    }
    return orElse();
  }
}

abstract class RateLimitFailure extends Failure {
  const factory RateLimitFailure({
    required final String message,
    final Duration? retryAfter,
  }) = _$RateLimitFailureImpl;
  const RateLimitFailure._() : super._();

  @override
  String get message;
  Duration? get retryAfter;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RateLimitFailureImplCopyWith<_$RateLimitFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelledFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$CancelledFailureImplCopyWith(
    _$CancelledFailureImpl value,
    $Res Function(_$CancelledFailureImpl) then,
  ) = __$$CancelledFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CancelledFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CancelledFailureImpl>
    implements _$$CancelledFailureImplCopyWith<$Res> {
  __$$CancelledFailureImplCopyWithImpl(
    _$CancelledFailureImpl _value,
    $Res Function(_$CancelledFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CancelledFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CancelledFailureImpl extends CancelledFailure {
  const _$CancelledFailureImpl({this.message = 'Request was cancelled'})
    : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.cancelled(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelledFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelledFailureImplCopyWith<_$CancelledFailureImpl> get copyWith =>
      __$$CancelledFailureImplCopyWithImpl<_$CancelledFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )
    network,
    required TResult Function(
      String message,
      int? statusCode,
      String? serverMessage,
    )
    server,
    required TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )
    auth,
    required TResult Function(
      String message,
      Map<String, List<String>>? fieldErrors,
    )
    validation,
    required TResult Function(String message, String? resource) notFound,
    required TResult Function(String message, Duration? retryAfter) rateLimit,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) cache,
    required TResult Function(
      String message,
      Object? error,
      StackTrace? stackTrace,
    )
    unknown,
  }) {
    return cancelled(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult? Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult? Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult? Function(String message, String? resource)? notFound,
    TResult? Function(String message, Duration? retryAfter)? rateLimit,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
  }) {
    return cancelled?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult Function(String message, String? resource)? notFound,
    TResult Function(String message, Duration? retryAfter)? rateLimit,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(RateLimitFailure value) rateLimit,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(RateLimitFailure value)? rateLimit,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(RateLimitFailure value)? rateLimit,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class CancelledFailure extends Failure {
  const factory CancelledFailure({final String message}) =
      _$CancelledFailureImpl;
  const CancelledFailure._() : super._();

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelledFailureImplCopyWith<_$CancelledFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$CacheFailureImplCopyWith(
    _$CacheFailureImpl value,
    $Res Function(_$CacheFailureImpl) then,
  ) = __$$CacheFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CacheFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CacheFailureImpl>
    implements _$$CacheFailureImplCopyWith<$Res> {
  __$$CacheFailureImplCopyWithImpl(
    _$CacheFailureImpl _value,
    $Res Function(_$CacheFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CacheFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CacheFailureImpl extends CacheFailure {
  const _$CacheFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.cache(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheFailureImplCopyWith<_$CacheFailureImpl> get copyWith =>
      __$$CacheFailureImplCopyWithImpl<_$CacheFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )
    network,
    required TResult Function(
      String message,
      int? statusCode,
      String? serverMessage,
    )
    server,
    required TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )
    auth,
    required TResult Function(
      String message,
      Map<String, List<String>>? fieldErrors,
    )
    validation,
    required TResult Function(String message, String? resource) notFound,
    required TResult Function(String message, Duration? retryAfter) rateLimit,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) cache,
    required TResult Function(
      String message,
      Object? error,
      StackTrace? stackTrace,
    )
    unknown,
  }) {
    return cache(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult? Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult? Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult? Function(String message, String? resource)? notFound,
    TResult? Function(String message, Duration? retryAfter)? rateLimit,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
  }) {
    return cache?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult Function(String message, String? resource)? notFound,
    TResult Function(String message, Duration? retryAfter)? rateLimit,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(RateLimitFailure value) rateLimit,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(RateLimitFailure value)? rateLimit,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(RateLimitFailure value)? rateLimit,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheFailure extends Failure {
  const factory CacheFailure({required final String message}) =
      _$CacheFailureImpl;
  const CacheFailure._() : super._();

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheFailureImplCopyWith<_$CacheFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(
    _$UnknownFailureImpl value,
    $Res Function(_$UnknownFailureImpl) then,
  ) = __$$UnknownFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
    _$UnknownFailureImpl _value,
    $Res Function(_$UnknownFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(
      _$UnknownFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        error: freezed == error ? _value.error : error,
        stackTrace: freezed == stackTrace
            ? _value.stackTrace
            : stackTrace // ignore: cast_nullable_to_non_nullable
                  as StackTrace?,
      ),
    );
  }
}

/// @nodoc

class _$UnknownFailureImpl extends UnknownFailure {
  const _$UnknownFailureImpl({
    required this.message,
    this.error,
    this.stackTrace,
  }) : super._();

  @override
  final String message;
  @override
  final Object? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'Failure.unknown(message: $message, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(error),
    stackTrace,
  );

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      __$$UnknownFailureImplCopyWithImpl<_$UnknownFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )
    network,
    required TResult Function(
      String message,
      int? statusCode,
      String? serverMessage,
    )
    server,
    required TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )
    auth,
    required TResult Function(
      String message,
      Map<String, List<String>>? fieldErrors,
    )
    validation,
    required TResult Function(String message, String? resource) notFound,
    required TResult Function(String message, Duration? retryAfter) rateLimit,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) cache,
    required TResult Function(
      String message,
      Object? error,
      StackTrace? stackTrace,
    )
    unknown,
  }) {
    return unknown(message, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult? Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult? Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult? Function(String message, String? resource)? notFound,
    TResult? Function(String message, Duration? retryAfter)? rateLimit,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
  }) {
    return unknown?.call(message, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String message,
      int? statusCode,
      bool isTimeout,
      bool isConnectionError,
    )?
    network,
    TResult Function(String message, int? statusCode, String? serverMessage)?
    server,
    TResult Function(
      String message,
      bool isTokenExpired,
      bool isUnauthorized,
      bool isForbidden,
    )?
    auth,
    TResult Function(String message, Map<String, List<String>>? fieldErrors)?
    validation,
    TResult Function(String message, String? resource)? notFound,
    TResult Function(String message, Duration? retryAfter)? rateLimit,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? error, StackTrace? stackTrace)?
    unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message, error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(RateLimitFailure value) rateLimit,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(RateLimitFailure value)? rateLimit,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(RateLimitFailure value)? rateLimit,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownFailure extends Failure {
  const factory UnknownFailure({
    required final String message,
    final Object? error,
    final StackTrace? stackTrace,
  }) = _$UnknownFailureImpl;
  const UnknownFailure._() : super._();

  @override
  String get message;
  Object? get error;
  StackTrace? get stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
