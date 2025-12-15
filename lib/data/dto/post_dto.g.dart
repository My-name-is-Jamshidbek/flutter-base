// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostDtoImpl _$$PostDtoImplFromJson(Map<String, dynamic> json) =>
    _$PostDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      excerpt: json['excerpt'] as String?,
      featuredImage: json['featured_image'] as String?,
      authorId: json['author_id'] as String,
      author: json['author'] == null
          ? null
          : UserDto.fromJson(json['author'] as Map<String, dynamic>),
      status:
          $enumDecodeNullable(_$PostStatusEnumMap, json['status']) ??
          PostStatus.draft,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      viewCount: (json['view_count'] as num?)?.toInt() ?? 0,
      likeCount: (json['like_count'] as num?)?.toInt() ?? 0,
      commentCount: (json['comment_count'] as num?)?.toInt() ?? 0,
      isFeatured: json['is_featured'] as bool? ?? false,
      isPinned: json['is_pinned'] as bool? ?? false,
      publishedAt: json['published_at'] == null
          ? null
          : DateTime.parse(json['published_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      meta: json['meta'] == null
          ? null
          : PostMetaDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostDtoImplToJson(_$PostDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'excerpt': instance.excerpt,
      'featured_image': instance.featuredImage,
      'author_id': instance.authorId,
      'author': instance.author,
      'status': _$PostStatusEnumMap[instance.status]!,
      'tags': instance.tags,
      'categories': instance.categories,
      'view_count': instance.viewCount,
      'like_count': instance.likeCount,
      'comment_count': instance.commentCount,
      'is_featured': instance.isFeatured,
      'is_pinned': instance.isPinned,
      'published_at': instance.publishedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'meta': instance.meta,
    };

const _$PostStatusEnumMap = {
  PostStatus.draft: 'draft',
  PostStatus.pending: 'pending',
  PostStatus.published: 'published',
  PostStatus.archived: 'archived',
};

_$CategoryDtoImpl _$$CategoryDtoImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      parentId: json['parent_id'] as String?,
      postCount: (json['post_count'] as num?)?.toInt() ?? 0,
      icon: json['icon'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$CategoryDtoImplToJson(_$CategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'parent_id': instance.parentId,
      'post_count': instance.postCount,
      'icon': instance.icon,
      'color': instance.color,
    };

_$PostMetaDtoImpl _$$PostMetaDtoImplFromJson(Map<String, dynamic> json) =>
    _$PostMetaDtoImpl(
      seoTitle: json['seo_title'] as String?,
      seoDescription: json['seo_description'] as String?,
      ogImage: json['og_image'] as String?,
      keywords:
          (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      canonicalUrl: json['canonical_url'] as String?,
      noIndex: json['no_index'] as bool? ?? false,
    );

Map<String, dynamic> _$$PostMetaDtoImplToJson(_$PostMetaDtoImpl instance) =>
    <String, dynamic>{
      'seo_title': instance.seoTitle,
      'seo_description': instance.seoDescription,
      'og_image': instance.ogImage,
      'keywords': instance.keywords,
      'canonical_url': instance.canonicalUrl,
      'no_index': instance.noIndex,
    };

_$CreatePostRequestDtoImpl _$$CreatePostRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CreatePostRequestDtoImpl(
  title: json['title'] as String,
  content: json['content'] as String,
  excerpt: json['excerpt'] as String?,
  featuredImage: json['featured_image'] as String?,
  status:
      $enumDecodeNullable(_$PostStatusEnumMap, json['status']) ??
      PostStatus.draft,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  categoryIds:
      (json['category_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  meta: json['meta'] == null
      ? null
      : PostMetaDto.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CreatePostRequestDtoImplToJson(
  _$CreatePostRequestDtoImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'content': instance.content,
  'excerpt': instance.excerpt,
  'featured_image': instance.featuredImage,
  'status': _$PostStatusEnumMap[instance.status]!,
  'tags': instance.tags,
  'category_ids': instance.categoryIds,
  'meta': instance.meta,
};

_$UpdatePostRequestDtoImpl _$$UpdatePostRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$UpdatePostRequestDtoImpl(
  title: json['title'] as String?,
  content: json['content'] as String?,
  excerpt: json['excerpt'] as String?,
  featuredImage: json['featured_image'] as String?,
  status: $enumDecodeNullable(_$PostStatusEnumMap, json['status']),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  categoryIds: (json['category_ids'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  meta: json['meta'] == null
      ? null
      : PostMetaDto.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UpdatePostRequestDtoImplToJson(
  _$UpdatePostRequestDtoImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'content': instance.content,
  'excerpt': instance.excerpt,
  'featured_image': instance.featuredImage,
  'status': _$PostStatusEnumMap[instance.status],
  'tags': instance.tags,
  'category_ids': instance.categoryIds,
  'meta': instance.meta,
};

_$PostQueryDtoImpl _$$PostQueryDtoImplFromJson(Map<String, dynamic> json) =>
    _$PostQueryDtoImpl(
      search: json['search'] as String?,
      status: $enumDecodeNullable(_$PostStatusEnumMap, json['status']),
      authorId: json['author_id'] as String?,
      categoryId: json['category_id'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isFeatured: json['is_featured'] as bool?,
      page: (json['page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 20,
      sortBy: json['sort_by'] as String? ?? 'created_at',
      sortOrder: json['sort_order'] as String? ?? 'desc',
    );

Map<String, dynamic> _$$PostQueryDtoImplToJson(_$PostQueryDtoImpl instance) =>
    <String, dynamic>{
      'search': instance.search,
      'status': _$PostStatusEnumMap[instance.status],
      'author_id': instance.authorId,
      'category_id': instance.categoryId,
      'tags': instance.tags,
      'is_featured': instance.isFeatured,
      'page': instance.page,
      'per_page': instance.perPage,
      'sort_by': instance.sortBy,
      'sort_order': instance.sortOrder,
    };
