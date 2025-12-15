import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/network/api_client.dart';
import '../../core/network/result.dart';
import '../dto/api_response.dart';
import '../dto/post_dto.dart';
import 'base_repository.dart';

part 'post_repository.g.dart';

/// Repository for post-related API operations.
///
/// Demonstrates:
/// - CRUD operations
/// - Pagination
/// - Query parameters
/// - File uploads
abstract class PostRepository {
  /// Get all posts with optional filtering.
  AsyncResult<PaginatedResponse<PostDto>> getPosts(PostQueryDto query);

  /// Get a single post by ID.
  AsyncResult<PostDto> getPost(String id);

  /// Create a new post.
  AsyncResult<PostDto> createPost(CreatePostRequestDto request);

  /// Update an existing post.
  AsyncResult<PostDto> updatePost(String id, UpdatePostRequestDto request);

  /// Delete a post.
  AsyncResult<void> deletePost(String id);

  /// Get featured posts.
  AsyncResult<List<PostDto>> getFeaturedPosts();

  /// Get posts by author.
  AsyncResult<PaginatedResponse<PostDto>> getPostsByAuthor(
    String authorId, {
    int page = 1,
    int perPage = 20,
  });

  /// Get posts by category.
  AsyncResult<PaginatedResponse<PostDto>> getPostsByCategory(
    String categoryId, {
    int page = 1,
    int perPage = 20,
  });

  /// Search posts.
  AsyncResult<PaginatedResponse<PostDto>> searchPosts(
    String query, {
    int page = 1,
    int perPage = 20,
  });

  /// Like a post.
  AsyncResult<PostDto> likePost(String id);

  /// Unlike a post.
  AsyncResult<PostDto> unlikePost(String id);

  /// Get all categories.
  AsyncResult<List<CategoryDto>> getCategories();
}

/// Implementation of [PostRepository].
class PostRepositoryImpl extends BaseRepository implements PostRepository {
  PostRepositoryImpl(super.apiClient);

  static const _basePath = '/posts';
  static const _categoriesPath = '/categories';

  @override
  AsyncResult<PaginatedResponse<PostDto>> getPosts(PostQueryDto query) async {
    return safeApiCall(
      () =>
          apiClient.get(_basePath, queryParameters: query.toQueryParameters()),
      (data) => PaginatedResponse<PostDto>.fromJson(
        data as Map<String, dynamic>,
        (item) => PostDto.fromJson(item as Map<String, dynamic>),
      ),
    );
  }

  @override
  AsyncResult<PostDto> getPost(String id) async {
    return safeApiCall(
      () => apiClient.get('$_basePath/$id'),
      (data) => PostDto.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  AsyncResult<PostDto> createPost(CreatePostRequestDto request) async {
    return safeApiCall(
      () => apiClient.post(_basePath, data: request.toJson()),
      (data) => PostDto.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  AsyncResult<PostDto> updatePost(
    String id,
    UpdatePostRequestDto request,
  ) async {
    return safeApiCall(
      () => apiClient.patch('$_basePath/$id', data: request.toJson()),
      (data) => PostDto.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  AsyncResult<void> deletePost(String id) async {
    return safeApiCallVoid(() => apiClient.delete('$_basePath/$id'));
  }

  @override
  AsyncResult<List<PostDto>> getFeaturedPosts() async {
    return safeApiCallList(
      () => apiClient.get(
        _basePath,
        queryParameters: {'is_featured': true, 'per_page': 10},
      ),
      (item) => PostDto.fromJson(item as Map<String, dynamic>),
    );
  }

  @override
  AsyncResult<PaginatedResponse<PostDto>> getPostsByAuthor(
    String authorId, {
    int page = 1,
    int perPage = 20,
  }) async {
    return safeApiCall(
      () => apiClient.get(
        _basePath,
        queryParameters: {
          'author_id': authorId,
          'page': page,
          'per_page': perPage,
        },
      ),
      (data) => PaginatedResponse<PostDto>.fromJson(
        data as Map<String, dynamic>,
        (item) => PostDto.fromJson(item as Map<String, dynamic>),
      ),
    );
  }

  @override
  AsyncResult<PaginatedResponse<PostDto>> getPostsByCategory(
    String categoryId, {
    int page = 1,
    int perPage = 20,
  }) async {
    return safeApiCall(
      () => apiClient.get(
        _basePath,
        queryParameters: {
          'category_id': categoryId,
          'page': page,
          'per_page': perPage,
        },
      ),
      (data) => PaginatedResponse<PostDto>.fromJson(
        data as Map<String, dynamic>,
        (item) => PostDto.fromJson(item as Map<String, dynamic>),
      ),
    );
  }

  @override
  AsyncResult<PaginatedResponse<PostDto>> searchPosts(
    String query, {
    int page = 1,
    int perPage = 20,
  }) async {
    return safeApiCall(
      () => apiClient.get(
        '$_basePath/search',
        queryParameters: {'q': query, 'page': page, 'per_page': perPage},
      ),
      (data) => PaginatedResponse<PostDto>.fromJson(
        data as Map<String, dynamic>,
        (item) => PostDto.fromJson(item as Map<String, dynamic>),
      ),
    );
  }

  @override
  AsyncResult<PostDto> likePost(String id) async {
    return safeApiCall(
      () => apiClient.post('$_basePath/$id/like'),
      (data) => PostDto.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  AsyncResult<PostDto> unlikePost(String id) async {
    return safeApiCall(
      () => apiClient.delete('$_basePath/$id/like'),
      (data) => PostDto.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  AsyncResult<List<CategoryDto>> getCategories() async {
    return safeApiCallList(
      () => apiClient.get(_categoriesPath),
      (item) => CategoryDto.fromJson(item as Map<String, dynamic>),
    );
  }
}

/// Provider for [PostRepository].
@Riverpod(keepAlive: true)
PostRepository postRepository(Ref ref) {
  final client = ref.watch(httpClientProvider);
  return PostRepositoryImpl(client);
}
