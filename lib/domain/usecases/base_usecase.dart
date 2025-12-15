/// Base class for use cases.
///
/// Use cases encapsulate business logic and represent a single action
/// that can be performed in the application.
abstract class UseCase<T, Params> {
  /// Execute the use case with the given parameters.
  Future<T> call(Params params);
}

/// Use case with no parameters.
abstract class NoParamsUseCase<T> {
  /// Execute the use case.
  Future<T> call();
}

/// Empty parameters for use cases that don't need any.
class NoParams {
  const NoParams();
}

/// Example use case implementation.
/// 
/// ```dart
/// class GetUserUseCase extends UseCase<User, int> {
///   final UserRepository _repository;
/// 
///   GetUserUseCase(this._repository);
/// 
///   @override
///   Future<User> call(int userId) {
///     return _repository.getUser(userId);
///   }
/// }
/// 
/// class GetCurrentUserUseCase extends NoParamsUseCase<User> {
///   final UserRepository _repository;
/// 
///   GetCurrentUserUseCase(this._repository);
/// 
///   @override
///   Future<User> call() {
///     return _repository.getCurrentUser();
///   }
/// }
/// ```
