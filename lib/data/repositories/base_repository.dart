/// Base class for repositories.
///
/// Repositories act as an abstraction layer between data sources and the domain layer.
/// They handle data fetching, caching, and transformation from DTOs to domain entities.
abstract class BaseRepository {
  const BaseRepository();
}

/// Example repository implementation.
/// 
/// ```dart
/// class UserRepository extends BaseRepository {
///   final ApiClient _apiClient;
/// 
///   UserRepository(this._apiClient);
/// 
///   Future<User> getUser(int id) async {
///     final response = await _apiClient.get('/users/$id');
///     final dto = UserDto.fromJson(response.data);
///     return dto.toEntity();
///   }
/// 
///   Future<List<User>> getUsers() async {
///     final response = await _apiClient.get('/users');
///     final dtos = (response.data as List).map((e) => UserDto.fromJson(e));
///     return dtos.map((dto) => dto.toEntity()).toList();
///   }
/// }
/// ```
