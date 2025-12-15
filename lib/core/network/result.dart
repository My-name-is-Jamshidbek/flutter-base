import 'package:fpdart/fpdart.dart';
import 'package:app_template/core/network/failures.dart';

/// Type alias for Either with Failure as left type.
///
/// Usage:
/// ```dart
/// Future<Result<User>> getUser(String id) async {
///   try {
///     final user = await api.getUser(id);
///     return Right(user);
///   } catch (e) {
///     return Left(Failure.unknown(message: e.toString()));
///   }
/// }
/// ```
typedef Result<T> = Either<Failure, T>;

/// Type alias for async Result.
typedef AsyncResult<T> = Future<Result<T>>;

/// Extension methods for Result type.
extension ResultX<T> on Result<T> {
  /// Whether the result is a success.
  bool get isSuccess => isRight();

  /// Whether the result is a failure.
  bool get isFailure => isLeft();

  /// Get the success value or null.
  T? get valueOrNull => fold((_) => null, (r) => r);

  /// Get the failure or null.
  Failure? get failureOrNull => fold((l) => l, (_) => null);

  /// Get the success value or throw the failure.
  T get valueOrThrow =>
      fold((failure) => throw Exception(failure.userMessage), (value) => value);

  /// Map the success value to another type.
  Result<R> mapValue<R>(R Function(T value) mapper) => map(mapper);

  /// Map the failure to another failure.
  Result<T> mapFailure(Failure Function(Failure failure) mapper) =>
      mapLeft(mapper);

  /// Execute a side effect on success.
  Result<T> onSuccess(void Function(T value) action) {
    if (isRight()) {
      action(valueOrNull as T);
    }
    return this;
  }

  /// Execute a side effect on failure.
  Result<T> onFailure(void Function(Failure failure) action) {
    if (isLeft()) {
      action(failureOrNull!);
    }
    return this;
  }

  /// Convert to a nullable value, returning null on failure.
  T? toNullable() => fold((_) => null, (r) => r);

  /// Convert failure to a recoverable state if possible.
  Result<T> recover(T Function(Failure failure) recovery) {
    return fold(
      (failure) =>
          failure.isRecoverable ? Right(recovery(failure)) : Left(failure),
      (value) => Right(value),
    );
  }
}

/// Extension methods for AsyncResult type.
extension AsyncResultX<T> on AsyncResult<T> {
  /// Map the success value asynchronously.
  AsyncResult<R> mapAsync<R>(Future<R> Function(T value) mapper) async {
    final result = await this;
    return result.fold(
      (failure) => Left(failure),
      (value) async => Right(await mapper(value)),
    );
  }

  /// FlatMap the success value asynchronously.
  AsyncResult<R> flatMapAsync<R>(
    AsyncResult<R> Function(T value) mapper,
  ) async {
    final result = await this;
    return result.fold((failure) => Left(failure), (value) => mapper(value));
  }

  /// Execute a side effect on success asynchronously.
  AsyncResult<T> onSuccessAsync(Future<void> Function(T value) action) async {
    final result = await this;
    if (result.isRight()) {
      await action(result.valueOrNull as T);
    }
    return result;
  }

  /// Execute a side effect on failure asynchronously.
  AsyncResult<T> onFailureAsync(
    Future<void> Function(Failure failure) action,
  ) async {
    final result = await this;
    if (result.isLeft()) {
      await action(result.failureOrNull!);
    }
    return result;
  }
}

/// Helper functions for creating Results.
class Results {
  Results._();

  /// Create a success result.
  static Result<T> success<T>(T value) => Right(value);

  /// Create a failure result.
  static Result<T> failure<T>(Failure failure) => Left(failure);

  /// Create a result from a nullable value.
  static Result<T> fromNullable<T>(T? value, Failure Function() onNull) =>
      value != null ? Right(value) : Left(onNull());

  /// Create a result from a try-catch block.
  static Result<T> tryCatch<T>(
    T Function() computation,
    Failure Function(Object error, StackTrace stack) onError,
  ) {
    try {
      return Right(computation());
    } catch (e, s) {
      return Left(onError(e, s));
    }
  }

  /// Create an async result from a try-catch block.
  static AsyncResult<T> tryCatchAsync<T>(
    Future<T> Function() computation,
    Failure Function(Object error, StackTrace stack) onError,
  ) async {
    try {
      return Right(await computation());
    } catch (e, s) {
      return Left(onError(e, s));
    }
  }
}

/// Unit type for operations that don't return a value.
typedef Unit = void;

/// Constant unit value.
const unit = null;
