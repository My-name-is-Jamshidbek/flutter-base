import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_dto.dart';

part 'post_dto.freezed.dart';
part 'post_dto.g.dart';

/// Post data transfer object.
///
/// Example DTO demonstrating:
/// - Enum serialization with custom values
/// - Nested objects with relationships
/// - Complex list handling
/// - Computed properties
@freezed
class PostDto with _$PostDto {
  const PostDto._();

  const factory PostDto({
    required String id,
    required String title,
    required String content,
    String? excerpt,
    @JsonKey(name: 'featured_image') String? featuredImage,
    @JsonKey(name: 'author_id') required String authorId,
    UserDto? author,
    @Default(PostStatus.draft) PostStatus status,
    @Default([]) List<String> tags,
    @Default([]) List<CategoryDto> categories,
    @Default(0) @JsonKey(name: 'view_count') int viewCount,
    @Default(0) @JsonKey(name: 'like_count') int likeCount,
    @Default(0) @JsonKey(name: 'comment_count') int commentCount,
    @JsonKey(name: 'is_featured') @Default(false) bool isFeatured,
    @JsonKey(name: 'is_pinned') @Default(false) bool isPinned,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    PostMetaDto? meta,
  }) = _PostDto;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  /// Whether the post is published.
  bool get isPublished => status == PostStatus.published;

  /// Whether the post is a draft.
  bool get isDraft => status == PostStatus.draft;

  /// Formatted view count (e.g., "1.2K", "3.4M").
  String get formattedViewCount => _formatCount(viewCount);

  /// Formatted like count.
  String get formattedLikeCount => _formatCount(likeCount);

  /// Formatted comment count.
  String get formattedCommentCount => _formatCount(commentCount);

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    }
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }

  /// Reading time estimate in minutes.
  int get readingTimeMinutes {
    const wordsPerMinute = 200;
    final wordCount = content.split(RegExp(r'\s+')).length;
    final minutes = (wordCount / wordsPerMinute).ceil();
    return minutes < 1 ? 1 : minutes;
  }
}

/// Post status enum.
@JsonEnum(valueField: 'value')
enum PostStatus {
  draft('draft'),
  pending('pending'),
  published('published'),
  archived('archived');

  const PostStatus(this.value);
  final String value;
}

/// Category data transfer object.
@freezed
class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    required String id,
    required String name,
    required String slug,
    String? description,
    @JsonKey(name: 'parent_id') String? parentId,
    @JsonKey(name: 'post_count') @Default(0) int postCount,
    String? icon,
    String? color,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}

/// Post metadata.
@freezed
class PostMetaDto with _$PostMetaDto {
  const factory PostMetaDto({
    @JsonKey(name: 'seo_title') String? seoTitle,
    @JsonKey(name: 'seo_description') String? seoDescription,
    @JsonKey(name: 'og_image') String? ogImage,
    @Default([]) List<String> keywords,
    @JsonKey(name: 'canonical_url') String? canonicalUrl,
    @JsonKey(name: 'no_index') @Default(false) bool noIndex,
  }) = _PostMetaDto;

  factory PostMetaDto.fromJson(Map<String, dynamic> json) =>
      _$PostMetaDtoFromJson(json);
}

/// Create post request.
@freezed
class CreatePostRequestDto with _$CreatePostRequestDto {
  const factory CreatePostRequestDto({
    required String title,
    required String content,
    String? excerpt,
    @JsonKey(name: 'featured_image') String? featuredImage,
    @Default(PostStatus.draft) PostStatus status,
    @Default([]) List<String> tags,
    @JsonKey(name: 'category_ids') @Default([]) List<String> categoryIds,
    PostMetaDto? meta,
  }) = _CreatePostRequestDto;

  factory CreatePostRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestDtoFromJson(json);
}

/// Update post request.
@freezed
class UpdatePostRequestDto with _$UpdatePostRequestDto {
  const factory UpdatePostRequestDto({
    String? title,
    String? content,
    String? excerpt,
    @JsonKey(name: 'featured_image') String? featuredImage,
    PostStatus? status,
    List<String>? tags,
    @JsonKey(name: 'category_ids') List<String>? categoryIds,
    PostMetaDto? meta,
  }) = _UpdatePostRequestDto;

  factory UpdatePostRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePostRequestDtoFromJson(json);
}

/// Post filter/query parameters.
@freezed
class PostQueryDto with _$PostQueryDto {
  const PostQueryDto._();

  const factory PostQueryDto({
    String? search,
    PostStatus? status,
    @JsonKey(name: 'author_id') String? authorId,
    @JsonKey(name: 'category_id') String? categoryId,
    List<String>? tags,
    @JsonKey(name: 'is_featured') bool? isFeatured,
    @Default(1) int page,
    @JsonKey(name: 'per_page') @Default(20) int perPage,
    @JsonKey(name: 'sort_by') @Default('created_at') String sortBy,
    @JsonKey(name: 'sort_order') @Default('desc') String sortOrder,
  }) = _PostQueryDto;

  factory PostQueryDto.fromJson(Map<String, dynamic> json) =>
      _$PostQueryDtoFromJson(json);

  /// Converts to query parameters map.
  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{};
    if (search != null) params['search'] = search;
    if (status != null) params['status'] = status!.value;
    if (authorId != null) params['author_id'] = authorId;
    if (categoryId != null) params['category_id'] = categoryId;
    if (tags != null && tags!.isNotEmpty) params['tags'] = tags!.join(',');
    if (isFeatured != null) params['is_featured'] = isFeatured;
    params['page'] = page;
    params['per_page'] = perPage;
    params['sort_by'] = sortBy;
    params['sort_order'] = sortOrder;
    return params;
  }
}
