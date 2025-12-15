// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PostDto _$PostDtoFromJson(Map<String, dynamic> json) {
  return _PostDto.fromJson(json);
}

/// @nodoc
mixin _$PostDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get excerpt => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured_image')
  String? get featuredImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_id')
  String get authorId => throw _privateConstructorUsedError;
  UserDto? get author => throw _privateConstructorUsedError;
  PostStatus get status => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<CategoryDto> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_count')
  int get viewCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_featured')
  bool get isFeatured => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_pinned')
  bool get isPinned => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  PostMetaDto? get meta => throw _privateConstructorUsedError;

  /// Serializes this PostDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostDtoCopyWith<PostDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDtoCopyWith<$Res> {
  factory $PostDtoCopyWith(PostDto value, $Res Function(PostDto) then) =
      _$PostDtoCopyWithImpl<$Res, PostDto>;
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    String? excerpt,
    @JsonKey(name: 'featured_image') String? featuredImage,
    @JsonKey(name: 'author_id') String authorId,
    UserDto? author,
    PostStatus status,
    List<String> tags,
    List<CategoryDto> categories,
    @JsonKey(name: 'view_count') int viewCount,
    @JsonKey(name: 'like_count') int likeCount,
    @JsonKey(name: 'comment_count') int commentCount,
    @JsonKey(name: 'is_featured') bool isFeatured,
    @JsonKey(name: 'is_pinned') bool isPinned,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    PostMetaDto? meta,
  });

  $UserDtoCopyWith<$Res>? get author;
  $PostMetaDtoCopyWith<$Res>? get meta;
}

/// @nodoc
class _$PostDtoCopyWithImpl<$Res, $Val extends PostDto>
    implements $PostDtoCopyWith<$Res> {
  _$PostDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? excerpt = freezed,
    Object? featuredImage = freezed,
    Object? authorId = null,
    Object? author = freezed,
    Object? status = null,
    Object? tags = null,
    Object? categories = null,
    Object? viewCount = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? isFeatured = null,
    Object? isPinned = null,
    Object? publishedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? meta = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            excerpt: freezed == excerpt
                ? _value.excerpt
                : excerpt // ignore: cast_nullable_to_non_nullable
                      as String?,
            featuredImage: freezed == featuredImage
                ? _value.featuredImage
                : featuredImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            authorId: null == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                      as String,
            author: freezed == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                      as UserDto?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PostStatus,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<CategoryDto>,
            viewCount: null == viewCount
                ? _value.viewCount
                : viewCount // ignore: cast_nullable_to_non_nullable
                      as int,
            likeCount: null == likeCount
                ? _value.likeCount
                : likeCount // ignore: cast_nullable_to_non_nullable
                      as int,
            commentCount: null == commentCount
                ? _value.commentCount
                : commentCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isFeatured: null == isFeatured
                ? _value.isFeatured
                : isFeatured // ignore: cast_nullable_to_non_nullable
                      as bool,
            isPinned: null == isPinned
                ? _value.isPinned
                : isPinned // ignore: cast_nullable_to_non_nullable
                      as bool,
            publishedAt: freezed == publishedAt
                ? _value.publishedAt
                : publishedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            meta: freezed == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as PostMetaDto?,
          )
          as $Val,
    );
  }

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostMetaDtoCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $PostMetaDtoCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostDtoImplCopyWith<$Res> implements $PostDtoCopyWith<$Res> {
  factory _$$PostDtoImplCopyWith(
    _$PostDtoImpl value,
    $Res Function(_$PostDtoImpl) then,
  ) = __$$PostDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    String? excerpt,
    @JsonKey(name: 'featured_image') String? featuredImage,
    @JsonKey(name: 'author_id') String authorId,
    UserDto? author,
    PostStatus status,
    List<String> tags,
    List<CategoryDto> categories,
    @JsonKey(name: 'view_count') int viewCount,
    @JsonKey(name: 'like_count') int likeCount,
    @JsonKey(name: 'comment_count') int commentCount,
    @JsonKey(name: 'is_featured') bool isFeatured,
    @JsonKey(name: 'is_pinned') bool isPinned,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    PostMetaDto? meta,
  });

  @override
  $UserDtoCopyWith<$Res>? get author;
  @override
  $PostMetaDtoCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$PostDtoImplCopyWithImpl<$Res>
    extends _$PostDtoCopyWithImpl<$Res, _$PostDtoImpl>
    implements _$$PostDtoImplCopyWith<$Res> {
  __$$PostDtoImplCopyWithImpl(
    _$PostDtoImpl _value,
    $Res Function(_$PostDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? excerpt = freezed,
    Object? featuredImage = freezed,
    Object? authorId = null,
    Object? author = freezed,
    Object? status = null,
    Object? tags = null,
    Object? categories = null,
    Object? viewCount = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? isFeatured = null,
    Object? isPinned = null,
    Object? publishedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? meta = freezed,
  }) {
    return _then(
      _$PostDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        excerpt: freezed == excerpt
            ? _value.excerpt
            : excerpt // ignore: cast_nullable_to_non_nullable
                  as String?,
        featuredImage: freezed == featuredImage
            ? _value.featuredImage
            : featuredImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        authorId: null == authorId
            ? _value.authorId
            : authorId // ignore: cast_nullable_to_non_nullable
                  as String,
        author: freezed == author
            ? _value.author
            : author // ignore: cast_nullable_to_non_nullable
                  as UserDto?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PostStatus,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<CategoryDto>,
        viewCount: null == viewCount
            ? _value.viewCount
            : viewCount // ignore: cast_nullable_to_non_nullable
                  as int,
        likeCount: null == likeCount
            ? _value.likeCount
            : likeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        commentCount: null == commentCount
            ? _value.commentCount
            : commentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isFeatured: null == isFeatured
            ? _value.isFeatured
            : isFeatured // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPinned: null == isPinned
            ? _value.isPinned
            : isPinned // ignore: cast_nullable_to_non_nullable
                  as bool,
        publishedAt: freezed == publishedAt
            ? _value.publishedAt
            : publishedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        meta: freezed == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as PostMetaDto?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostDtoImpl extends _PostDto {
  const _$PostDtoImpl({
    required this.id,
    required this.title,
    required this.content,
    this.excerpt,
    @JsonKey(name: 'featured_image') this.featuredImage,
    @JsonKey(name: 'author_id') required this.authorId,
    this.author,
    this.status = PostStatus.draft,
    final List<String> tags = const [],
    final List<CategoryDto> categories = const [],
    @JsonKey(name: 'view_count') this.viewCount = 0,
    @JsonKey(name: 'like_count') this.likeCount = 0,
    @JsonKey(name: 'comment_count') this.commentCount = 0,
    @JsonKey(name: 'is_featured') this.isFeatured = false,
    @JsonKey(name: 'is_pinned') this.isPinned = false,
    @JsonKey(name: 'published_at') this.publishedAt,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    this.meta,
  }) : _tags = tags,
       _categories = categories,
       super._();

  factory _$PostDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String? excerpt;
  @override
  @JsonKey(name: 'featured_image')
  final String? featuredImage;
  @override
  @JsonKey(name: 'author_id')
  final String authorId;
  @override
  final UserDto? author;
  @override
  @JsonKey()
  final PostStatus status;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<CategoryDto> _categories;
  @override
  @JsonKey()
  List<CategoryDto> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey(name: 'view_count')
  final int viewCount;
  @override
  @JsonKey(name: 'like_count')
  final int likeCount;
  @override
  @JsonKey(name: 'comment_count')
  final int commentCount;
  @override
  @JsonKey(name: 'is_featured')
  final bool isFeatured;
  @override
  @JsonKey(name: 'is_pinned')
  final bool isPinned;
  @override
  @JsonKey(name: 'published_at')
  final DateTime? publishedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final PostMetaDto? meta;

  @override
  String toString() {
    return 'PostDto(id: $id, title: $title, content: $content, excerpt: $excerpt, featuredImage: $featuredImage, authorId: $authorId, author: $author, status: $status, tags: $tags, categories: $categories, viewCount: $viewCount, likeCount: $likeCount, commentCount: $commentCount, isFeatured: $isFeatured, isPinned: $isPinned, publishedAt: $publishedAt, createdAt: $createdAt, updatedAt: $updatedAt, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.excerpt, excerpt) || other.excerpt == excerpt) &&
            (identical(other.featuredImage, featuredImage) ||
                other.featuredImage == featuredImage) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    title,
    content,
    excerpt,
    featuredImage,
    authorId,
    author,
    status,
    const DeepCollectionEquality().hash(_tags),
    const DeepCollectionEquality().hash(_categories),
    viewCount,
    likeCount,
    commentCount,
    isFeatured,
    isPinned,
    publishedAt,
    createdAt,
    updatedAt,
    meta,
  ]);

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostDtoImplCopyWith<_$PostDtoImpl> get copyWith =>
      __$$PostDtoImplCopyWithImpl<_$PostDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostDtoImplToJson(this);
  }
}

abstract class _PostDto extends PostDto {
  const factory _PostDto({
    required final String id,
    required final String title,
    required final String content,
    final String? excerpt,
    @JsonKey(name: 'featured_image') final String? featuredImage,
    @JsonKey(name: 'author_id') required final String authorId,
    final UserDto? author,
    final PostStatus status,
    final List<String> tags,
    final List<CategoryDto> categories,
    @JsonKey(name: 'view_count') final int viewCount,
    @JsonKey(name: 'like_count') final int likeCount,
    @JsonKey(name: 'comment_count') final int commentCount,
    @JsonKey(name: 'is_featured') final bool isFeatured,
    @JsonKey(name: 'is_pinned') final bool isPinned,
    @JsonKey(name: 'published_at') final DateTime? publishedAt,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    final PostMetaDto? meta,
  }) = _$PostDtoImpl;
  const _PostDto._() : super._();

  factory _PostDto.fromJson(Map<String, dynamic> json) = _$PostDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String? get excerpt;
  @override
  @JsonKey(name: 'featured_image')
  String? get featuredImage;
  @override
  @JsonKey(name: 'author_id')
  String get authorId;
  @override
  UserDto? get author;
  @override
  PostStatus get status;
  @override
  List<String> get tags;
  @override
  List<CategoryDto> get categories;
  @override
  @JsonKey(name: 'view_count')
  int get viewCount;
  @override
  @JsonKey(name: 'like_count')
  int get likeCount;
  @override
  @JsonKey(name: 'comment_count')
  int get commentCount;
  @override
  @JsonKey(name: 'is_featured')
  bool get isFeatured;
  @override
  @JsonKey(name: 'is_pinned')
  bool get isPinned;
  @override
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  PostMetaDto? get meta;

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostDtoImplCopyWith<_$PostDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) {
  return _CategoryDto.fromJson(json);
}

/// @nodoc
mixin _$CategoryDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  String? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_count')
  int get postCount => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  /// Serializes this CategoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDtoCopyWith<CategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDtoCopyWith<$Res> {
  factory $CategoryDtoCopyWith(
    CategoryDto value,
    $Res Function(CategoryDto) then,
  ) = _$CategoryDtoCopyWithImpl<$Res, CategoryDto>;
  @useResult
  $Res call({
    String id,
    String name,
    String slug,
    String? description,
    @JsonKey(name: 'parent_id') String? parentId,
    @JsonKey(name: 'post_count') int postCount,
    String? icon,
    String? color,
  });
}

/// @nodoc
class _$CategoryDtoCopyWithImpl<$Res, $Val extends CategoryDto>
    implements $CategoryDtoCopyWith<$Res> {
  _$CategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? description = freezed,
    Object? parentId = freezed,
    Object? postCount = null,
    Object? icon = freezed,
    Object? color = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            slug: null == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            parentId: freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            postCount: null == postCount
                ? _value.postCount
                : postCount // ignore: cast_nullable_to_non_nullable
                      as int,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryDtoImplCopyWith<$Res>
    implements $CategoryDtoCopyWith<$Res> {
  factory _$$CategoryDtoImplCopyWith(
    _$CategoryDtoImpl value,
    $Res Function(_$CategoryDtoImpl) then,
  ) = __$$CategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String slug,
    String? description,
    @JsonKey(name: 'parent_id') String? parentId,
    @JsonKey(name: 'post_count') int postCount,
    String? icon,
    String? color,
  });
}

/// @nodoc
class __$$CategoryDtoImplCopyWithImpl<$Res>
    extends _$CategoryDtoCopyWithImpl<$Res, _$CategoryDtoImpl>
    implements _$$CategoryDtoImplCopyWith<$Res> {
  __$$CategoryDtoImplCopyWithImpl(
    _$CategoryDtoImpl _value,
    $Res Function(_$CategoryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? description = freezed,
    Object? parentId = freezed,
    Object? postCount = null,
    Object? icon = freezed,
    Object? color = freezed,
  }) {
    return _then(
      _$CategoryDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        slug: null == slug
            ? _value.slug
            : slug // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        parentId: freezed == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        postCount: null == postCount
            ? _value.postCount
            : postCount // ignore: cast_nullable_to_non_nullable
                  as int,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDtoImpl implements _CategoryDto {
  const _$CategoryDtoImpl({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    @JsonKey(name: 'parent_id') this.parentId,
    @JsonKey(name: 'post_count') this.postCount = 0,
    this.icon,
    this.color,
  });

  factory _$CategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String? description;
  @override
  @JsonKey(name: 'parent_id')
  final String? parentId;
  @override
  @JsonKey(name: 'post_count')
  final int postCount;
  @override
  final String? icon;
  @override
  final String? color;

  @override
  String toString() {
    return 'CategoryDto(id: $id, name: $name, slug: $slug, description: $description, parentId: $parentId, postCount: $postCount, icon: $icon, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    slug,
    description,
    parentId,
    postCount,
    icon,
    color,
  );

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDtoImplCopyWith<_$CategoryDtoImpl> get copyWith =>
      __$$CategoryDtoImplCopyWithImpl<_$CategoryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDtoImplToJson(this);
  }
}

abstract class _CategoryDto implements CategoryDto {
  const factory _CategoryDto({
    required final String id,
    required final String name,
    required final String slug,
    final String? description,
    @JsonKey(name: 'parent_id') final String? parentId,
    @JsonKey(name: 'post_count') final int postCount,
    final String? icon,
    final String? color,
  }) = _$CategoryDtoImpl;

  factory _CategoryDto.fromJson(Map<String, dynamic> json) =
      _$CategoryDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  String? get description;
  @override
  @JsonKey(name: 'parent_id')
  String? get parentId;
  @override
  @JsonKey(name: 'post_count')
  int get postCount;
  @override
  String? get icon;
  @override
  String? get color;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDtoImplCopyWith<_$CategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostMetaDto _$PostMetaDtoFromJson(Map<String, dynamic> json) {
  return _PostMetaDto.fromJson(json);
}

/// @nodoc
mixin _$PostMetaDto {
  @JsonKey(name: 'seo_title')
  String? get seoTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'seo_description')
  String? get seoDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'og_image')
  String? get ogImage => throw _privateConstructorUsedError;
  List<String> get keywords => throw _privateConstructorUsedError;
  @JsonKey(name: 'canonical_url')
  String? get canonicalUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_index')
  bool get noIndex => throw _privateConstructorUsedError;

  /// Serializes this PostMetaDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostMetaDtoCopyWith<PostMetaDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostMetaDtoCopyWith<$Res> {
  factory $PostMetaDtoCopyWith(
    PostMetaDto value,
    $Res Function(PostMetaDto) then,
  ) = _$PostMetaDtoCopyWithImpl<$Res, PostMetaDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'seo_title') String? seoTitle,
    @JsonKey(name: 'seo_description') String? seoDescription,
    @JsonKey(name: 'og_image') String? ogImage,
    List<String> keywords,
    @JsonKey(name: 'canonical_url') String? canonicalUrl,
    @JsonKey(name: 'no_index') bool noIndex,
  });
}

/// @nodoc
class _$PostMetaDtoCopyWithImpl<$Res, $Val extends PostMetaDto>
    implements $PostMetaDtoCopyWith<$Res> {
  _$PostMetaDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seoTitle = freezed,
    Object? seoDescription = freezed,
    Object? ogImage = freezed,
    Object? keywords = null,
    Object? canonicalUrl = freezed,
    Object? noIndex = null,
  }) {
    return _then(
      _value.copyWith(
            seoTitle: freezed == seoTitle
                ? _value.seoTitle
                : seoTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            seoDescription: freezed == seoDescription
                ? _value.seoDescription
                : seoDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            ogImage: freezed == ogImage
                ? _value.ogImage
                : ogImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            keywords: null == keywords
                ? _value.keywords
                : keywords // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            canonicalUrl: freezed == canonicalUrl
                ? _value.canonicalUrl
                : canonicalUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            noIndex: null == noIndex
                ? _value.noIndex
                : noIndex // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostMetaDtoImplCopyWith<$Res>
    implements $PostMetaDtoCopyWith<$Res> {
  factory _$$PostMetaDtoImplCopyWith(
    _$PostMetaDtoImpl value,
    $Res Function(_$PostMetaDtoImpl) then,
  ) = __$$PostMetaDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'seo_title') String? seoTitle,
    @JsonKey(name: 'seo_description') String? seoDescription,
    @JsonKey(name: 'og_image') String? ogImage,
    List<String> keywords,
    @JsonKey(name: 'canonical_url') String? canonicalUrl,
    @JsonKey(name: 'no_index') bool noIndex,
  });
}

/// @nodoc
class __$$PostMetaDtoImplCopyWithImpl<$Res>
    extends _$PostMetaDtoCopyWithImpl<$Res, _$PostMetaDtoImpl>
    implements _$$PostMetaDtoImplCopyWith<$Res> {
  __$$PostMetaDtoImplCopyWithImpl(
    _$PostMetaDtoImpl _value,
    $Res Function(_$PostMetaDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seoTitle = freezed,
    Object? seoDescription = freezed,
    Object? ogImage = freezed,
    Object? keywords = null,
    Object? canonicalUrl = freezed,
    Object? noIndex = null,
  }) {
    return _then(
      _$PostMetaDtoImpl(
        seoTitle: freezed == seoTitle
            ? _value.seoTitle
            : seoTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        seoDescription: freezed == seoDescription
            ? _value.seoDescription
            : seoDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        ogImage: freezed == ogImage
            ? _value.ogImage
            : ogImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        keywords: null == keywords
            ? _value._keywords
            : keywords // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        canonicalUrl: freezed == canonicalUrl
            ? _value.canonicalUrl
            : canonicalUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        noIndex: null == noIndex
            ? _value.noIndex
            : noIndex // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostMetaDtoImpl implements _PostMetaDto {
  const _$PostMetaDtoImpl({
    @JsonKey(name: 'seo_title') this.seoTitle,
    @JsonKey(name: 'seo_description') this.seoDescription,
    @JsonKey(name: 'og_image') this.ogImage,
    final List<String> keywords = const [],
    @JsonKey(name: 'canonical_url') this.canonicalUrl,
    @JsonKey(name: 'no_index') this.noIndex = false,
  }) : _keywords = keywords;

  factory _$PostMetaDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostMetaDtoImplFromJson(json);

  @override
  @JsonKey(name: 'seo_title')
  final String? seoTitle;
  @override
  @JsonKey(name: 'seo_description')
  final String? seoDescription;
  @override
  @JsonKey(name: 'og_image')
  final String? ogImage;
  final List<String> _keywords;
  @override
  @JsonKey()
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  @JsonKey(name: 'canonical_url')
  final String? canonicalUrl;
  @override
  @JsonKey(name: 'no_index')
  final bool noIndex;

  @override
  String toString() {
    return 'PostMetaDto(seoTitle: $seoTitle, seoDescription: $seoDescription, ogImage: $ogImage, keywords: $keywords, canonicalUrl: $canonicalUrl, noIndex: $noIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostMetaDtoImpl &&
            (identical(other.seoTitle, seoTitle) ||
                other.seoTitle == seoTitle) &&
            (identical(other.seoDescription, seoDescription) ||
                other.seoDescription == seoDescription) &&
            (identical(other.ogImage, ogImage) || other.ogImage == ogImage) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.canonicalUrl, canonicalUrl) ||
                other.canonicalUrl == canonicalUrl) &&
            (identical(other.noIndex, noIndex) || other.noIndex == noIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    seoTitle,
    seoDescription,
    ogImage,
    const DeepCollectionEquality().hash(_keywords),
    canonicalUrl,
    noIndex,
  );

  /// Create a copy of PostMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostMetaDtoImplCopyWith<_$PostMetaDtoImpl> get copyWith =>
      __$$PostMetaDtoImplCopyWithImpl<_$PostMetaDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostMetaDtoImplToJson(this);
  }
}

abstract class _PostMetaDto implements PostMetaDto {
  const factory _PostMetaDto({
    @JsonKey(name: 'seo_title') final String? seoTitle,
    @JsonKey(name: 'seo_description') final String? seoDescription,
    @JsonKey(name: 'og_image') final String? ogImage,
    final List<String> keywords,
    @JsonKey(name: 'canonical_url') final String? canonicalUrl,
    @JsonKey(name: 'no_index') final bool noIndex,
  }) = _$PostMetaDtoImpl;

  factory _PostMetaDto.fromJson(Map<String, dynamic> json) =
      _$PostMetaDtoImpl.fromJson;

  @override
  @JsonKey(name: 'seo_title')
  String? get seoTitle;
  @override
  @JsonKey(name: 'seo_description')
  String? get seoDescription;
  @override
  @JsonKey(name: 'og_image')
  String? get ogImage;
  @override
  List<String> get keywords;
  @override
  @JsonKey(name: 'canonical_url')
  String? get canonicalUrl;
  @override
  @JsonKey(name: 'no_index')
  bool get noIndex;

  /// Create a copy of PostMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostMetaDtoImplCopyWith<_$PostMetaDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatePostRequestDto _$CreatePostRequestDtoFromJson(Map<String, dynamic> json) {
  return _CreatePostRequestDto.fromJson(json);
}

/// @nodoc
mixin _$CreatePostRequestDto {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get excerpt => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured_image')
  String? get featuredImage => throw _privateConstructorUsedError;
  PostStatus get status => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_ids')
  List<String> get categoryIds => throw _privateConstructorUsedError;
  PostMetaDto? get meta => throw _privateConstructorUsedError;

  /// Serializes this CreatePostRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePostRequestDtoCopyWith<CreatePostRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostRequestDtoCopyWith<$Res> {
  factory $CreatePostRequestDtoCopyWith(
    CreatePostRequestDto value,
    $Res Function(CreatePostRequestDto) then,
  ) = _$CreatePostRequestDtoCopyWithImpl<$Res, CreatePostRequestDto>;
  @useResult
  $Res call({
    String title,
    String content,
    String? excerpt,
    @JsonKey(name: 'featured_image') String? featuredImage,
    PostStatus status,
    List<String> tags,
    @JsonKey(name: 'category_ids') List<String> categoryIds,
    PostMetaDto? meta,
  });

  $PostMetaDtoCopyWith<$Res>? get meta;
}

/// @nodoc
class _$CreatePostRequestDtoCopyWithImpl<
  $Res,
  $Val extends CreatePostRequestDto
>
    implements $CreatePostRequestDtoCopyWith<$Res> {
  _$CreatePostRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? excerpt = freezed,
    Object? featuredImage = freezed,
    Object? status = null,
    Object? tags = null,
    Object? categoryIds = null,
    Object? meta = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            excerpt: freezed == excerpt
                ? _value.excerpt
                : excerpt // ignore: cast_nullable_to_non_nullable
                      as String?,
            featuredImage: freezed == featuredImage
                ? _value.featuredImage
                : featuredImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PostStatus,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            categoryIds: null == categoryIds
                ? _value.categoryIds
                : categoryIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            meta: freezed == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as PostMetaDto?,
          )
          as $Val,
    );
  }

  /// Create a copy of CreatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostMetaDtoCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $PostMetaDtoCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreatePostRequestDtoImplCopyWith<$Res>
    implements $CreatePostRequestDtoCopyWith<$Res> {
  factory _$$CreatePostRequestDtoImplCopyWith(
    _$CreatePostRequestDtoImpl value,
    $Res Function(_$CreatePostRequestDtoImpl) then,
  ) = __$$CreatePostRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String content,
    String? excerpt,
    @JsonKey(name: 'featured_image') String? featuredImage,
    PostStatus status,
    List<String> tags,
    @JsonKey(name: 'category_ids') List<String> categoryIds,
    PostMetaDto? meta,
  });

  @override
  $PostMetaDtoCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$CreatePostRequestDtoImplCopyWithImpl<$Res>
    extends _$CreatePostRequestDtoCopyWithImpl<$Res, _$CreatePostRequestDtoImpl>
    implements _$$CreatePostRequestDtoImplCopyWith<$Res> {
  __$$CreatePostRequestDtoImplCopyWithImpl(
    _$CreatePostRequestDtoImpl _value,
    $Res Function(_$CreatePostRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? excerpt = freezed,
    Object? featuredImage = freezed,
    Object? status = null,
    Object? tags = null,
    Object? categoryIds = null,
    Object? meta = freezed,
  }) {
    return _then(
      _$CreatePostRequestDtoImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        excerpt: freezed == excerpt
            ? _value.excerpt
            : excerpt // ignore: cast_nullable_to_non_nullable
                  as String?,
        featuredImage: freezed == featuredImage
            ? _value.featuredImage
            : featuredImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PostStatus,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        categoryIds: null == categoryIds
            ? _value._categoryIds
            : categoryIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        meta: freezed == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as PostMetaDto?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePostRequestDtoImpl implements _CreatePostRequestDto {
  const _$CreatePostRequestDtoImpl({
    required this.title,
    required this.content,
    this.excerpt,
    @JsonKey(name: 'featured_image') this.featuredImage,
    this.status = PostStatus.draft,
    final List<String> tags = const [],
    @JsonKey(name: 'category_ids') final List<String> categoryIds = const [],
    this.meta,
  }) : _tags = tags,
       _categoryIds = categoryIds;

  factory _$CreatePostRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePostRequestDtoImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final String? excerpt;
  @override
  @JsonKey(name: 'featured_image')
  final String? featuredImage;
  @override
  @JsonKey()
  final PostStatus status;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _categoryIds;
  @override
  @JsonKey(name: 'category_ids')
  List<String> get categoryIds {
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryIds);
  }

  @override
  final PostMetaDto? meta;

  @override
  String toString() {
    return 'CreatePostRequestDto(title: $title, content: $content, excerpt: $excerpt, featuredImage: $featuredImage, status: $status, tags: $tags, categoryIds: $categoryIds, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostRequestDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.excerpt, excerpt) || other.excerpt == excerpt) &&
            (identical(other.featuredImage, featuredImage) ||
                other.featuredImage == featuredImage) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(
              other._categoryIds,
              _categoryIds,
            ) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    content,
    excerpt,
    featuredImage,
    status,
    const DeepCollectionEquality().hash(_tags),
    const DeepCollectionEquality().hash(_categoryIds),
    meta,
  );

  /// Create a copy of CreatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostRequestDtoImplCopyWith<_$CreatePostRequestDtoImpl>
  get copyWith =>
      __$$CreatePostRequestDtoImplCopyWithImpl<_$CreatePostRequestDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePostRequestDtoImplToJson(this);
  }
}

abstract class _CreatePostRequestDto implements CreatePostRequestDto {
  const factory _CreatePostRequestDto({
    required final String title,
    required final String content,
    final String? excerpt,
    @JsonKey(name: 'featured_image') final String? featuredImage,
    final PostStatus status,
    final List<String> tags,
    @JsonKey(name: 'category_ids') final List<String> categoryIds,
    final PostMetaDto? meta,
  }) = _$CreatePostRequestDtoImpl;

  factory _CreatePostRequestDto.fromJson(Map<String, dynamic> json) =
      _$CreatePostRequestDtoImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  String? get excerpt;
  @override
  @JsonKey(name: 'featured_image')
  String? get featuredImage;
  @override
  PostStatus get status;
  @override
  List<String> get tags;
  @override
  @JsonKey(name: 'category_ids')
  List<String> get categoryIds;
  @override
  PostMetaDto? get meta;

  /// Create a copy of CreatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePostRequestDtoImplCopyWith<_$CreatePostRequestDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UpdatePostRequestDto _$UpdatePostRequestDtoFromJson(Map<String, dynamic> json) {
  return _UpdatePostRequestDto.fromJson(json);
}

/// @nodoc
mixin _$UpdatePostRequestDto {
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get excerpt => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured_image')
  String? get featuredImage => throw _privateConstructorUsedError;
  PostStatus? get status => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_ids')
  List<String>? get categoryIds => throw _privateConstructorUsedError;
  PostMetaDto? get meta => throw _privateConstructorUsedError;

  /// Serializes this UpdatePostRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePostRequestDtoCopyWith<UpdatePostRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePostRequestDtoCopyWith<$Res> {
  factory $UpdatePostRequestDtoCopyWith(
    UpdatePostRequestDto value,
    $Res Function(UpdatePostRequestDto) then,
  ) = _$UpdatePostRequestDtoCopyWithImpl<$Res, UpdatePostRequestDto>;
  @useResult
  $Res call({
    String? title,
    String? content,
    String? excerpt,
    @JsonKey(name: 'featured_image') String? featuredImage,
    PostStatus? status,
    List<String>? tags,
    @JsonKey(name: 'category_ids') List<String>? categoryIds,
    PostMetaDto? meta,
  });

  $PostMetaDtoCopyWith<$Res>? get meta;
}

/// @nodoc
class _$UpdatePostRequestDtoCopyWithImpl<
  $Res,
  $Val extends UpdatePostRequestDto
>
    implements $UpdatePostRequestDtoCopyWith<$Res> {
  _$UpdatePostRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? excerpt = freezed,
    Object? featuredImage = freezed,
    Object? status = freezed,
    Object? tags = freezed,
    Object? categoryIds = freezed,
    Object? meta = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            excerpt: freezed == excerpt
                ? _value.excerpt
                : excerpt // ignore: cast_nullable_to_non_nullable
                      as String?,
            featuredImage: freezed == featuredImage
                ? _value.featuredImage
                : featuredImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PostStatus?,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            categoryIds: freezed == categoryIds
                ? _value.categoryIds
                : categoryIds // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            meta: freezed == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as PostMetaDto?,
          )
          as $Val,
    );
  }

  /// Create a copy of UpdatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostMetaDtoCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $PostMetaDtoCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdatePostRequestDtoImplCopyWith<$Res>
    implements $UpdatePostRequestDtoCopyWith<$Res> {
  factory _$$UpdatePostRequestDtoImplCopyWith(
    _$UpdatePostRequestDtoImpl value,
    $Res Function(_$UpdatePostRequestDtoImpl) then,
  ) = __$$UpdatePostRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? title,
    String? content,
    String? excerpt,
    @JsonKey(name: 'featured_image') String? featuredImage,
    PostStatus? status,
    List<String>? tags,
    @JsonKey(name: 'category_ids') List<String>? categoryIds,
    PostMetaDto? meta,
  });

  @override
  $PostMetaDtoCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$UpdatePostRequestDtoImplCopyWithImpl<$Res>
    extends _$UpdatePostRequestDtoCopyWithImpl<$Res, _$UpdatePostRequestDtoImpl>
    implements _$$UpdatePostRequestDtoImplCopyWith<$Res> {
  __$$UpdatePostRequestDtoImplCopyWithImpl(
    _$UpdatePostRequestDtoImpl _value,
    $Res Function(_$UpdatePostRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? excerpt = freezed,
    Object? featuredImage = freezed,
    Object? status = freezed,
    Object? tags = freezed,
    Object? categoryIds = freezed,
    Object? meta = freezed,
  }) {
    return _then(
      _$UpdatePostRequestDtoImpl(
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        excerpt: freezed == excerpt
            ? _value.excerpt
            : excerpt // ignore: cast_nullable_to_non_nullable
                  as String?,
        featuredImage: freezed == featuredImage
            ? _value.featuredImage
            : featuredImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PostStatus?,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        categoryIds: freezed == categoryIds
            ? _value._categoryIds
            : categoryIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        meta: freezed == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as PostMetaDto?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePostRequestDtoImpl implements _UpdatePostRequestDto {
  const _$UpdatePostRequestDtoImpl({
    this.title,
    this.content,
    this.excerpt,
    @JsonKey(name: 'featured_image') this.featuredImage,
    this.status,
    final List<String>? tags,
    @JsonKey(name: 'category_ids') final List<String>? categoryIds,
    this.meta,
  }) : _tags = tags,
       _categoryIds = categoryIds;

  factory _$UpdatePostRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePostRequestDtoImplFromJson(json);

  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? excerpt;
  @override
  @JsonKey(name: 'featured_image')
  final String? featuredImage;
  @override
  final PostStatus? status;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _categoryIds;
  @override
  @JsonKey(name: 'category_ids')
  List<String>? get categoryIds {
    final value = _categoryIds;
    if (value == null) return null;
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PostMetaDto? meta;

  @override
  String toString() {
    return 'UpdatePostRequestDto(title: $title, content: $content, excerpt: $excerpt, featuredImage: $featuredImage, status: $status, tags: $tags, categoryIds: $categoryIds, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePostRequestDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.excerpt, excerpt) || other.excerpt == excerpt) &&
            (identical(other.featuredImage, featuredImage) ||
                other.featuredImage == featuredImage) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(
              other._categoryIds,
              _categoryIds,
            ) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    content,
    excerpt,
    featuredImage,
    status,
    const DeepCollectionEquality().hash(_tags),
    const DeepCollectionEquality().hash(_categoryIds),
    meta,
  );

  /// Create a copy of UpdatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePostRequestDtoImplCopyWith<_$UpdatePostRequestDtoImpl>
  get copyWith =>
      __$$UpdatePostRequestDtoImplCopyWithImpl<_$UpdatePostRequestDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePostRequestDtoImplToJson(this);
  }
}

abstract class _UpdatePostRequestDto implements UpdatePostRequestDto {
  const factory _UpdatePostRequestDto({
    final String? title,
    final String? content,
    final String? excerpt,
    @JsonKey(name: 'featured_image') final String? featuredImage,
    final PostStatus? status,
    final List<String>? tags,
    @JsonKey(name: 'category_ids') final List<String>? categoryIds,
    final PostMetaDto? meta,
  }) = _$UpdatePostRequestDtoImpl;

  factory _UpdatePostRequestDto.fromJson(Map<String, dynamic> json) =
      _$UpdatePostRequestDtoImpl.fromJson;

  @override
  String? get title;
  @override
  String? get content;
  @override
  String? get excerpt;
  @override
  @JsonKey(name: 'featured_image')
  String? get featuredImage;
  @override
  PostStatus? get status;
  @override
  List<String>? get tags;
  @override
  @JsonKey(name: 'category_ids')
  List<String>? get categoryIds;
  @override
  PostMetaDto? get meta;

  /// Create a copy of UpdatePostRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePostRequestDtoImplCopyWith<_$UpdatePostRequestDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PostQueryDto _$PostQueryDtoFromJson(Map<String, dynamic> json) {
  return _PostQueryDto.fromJson(json);
}

/// @nodoc
mixin _$PostQueryDto {
  String? get search => throw _privateConstructorUsedError;
  PostStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_id')
  String? get authorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_featured')
  bool? get isFeatured => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_by')
  String get sortBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  String get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this PostQueryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostQueryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostQueryDtoCopyWith<PostQueryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostQueryDtoCopyWith<$Res> {
  factory $PostQueryDtoCopyWith(
    PostQueryDto value,
    $Res Function(PostQueryDto) then,
  ) = _$PostQueryDtoCopyWithImpl<$Res, PostQueryDto>;
  @useResult
  $Res call({
    String? search,
    PostStatus? status,
    @JsonKey(name: 'author_id') String? authorId,
    @JsonKey(name: 'category_id') String? categoryId,
    List<String>? tags,
    @JsonKey(name: 'is_featured') bool? isFeatured,
    int page,
    @JsonKey(name: 'per_page') int perPage,
    @JsonKey(name: 'sort_by') String sortBy,
    @JsonKey(name: 'sort_order') String sortOrder,
  });
}

/// @nodoc
class _$PostQueryDtoCopyWithImpl<$Res, $Val extends PostQueryDto>
    implements $PostQueryDtoCopyWith<$Res> {
  _$PostQueryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostQueryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? status = freezed,
    Object? authorId = freezed,
    Object? categoryId = freezed,
    Object? tags = freezed,
    Object? isFeatured = freezed,
    Object? page = null,
    Object? perPage = null,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _value.copyWith(
            search: freezed == search
                ? _value.search
                : search // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PostStatus?,
            authorId: freezed == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            isFeatured: freezed == isFeatured
                ? _value.isFeatured
                : isFeatured // ignore: cast_nullable_to_non_nullable
                      as bool?,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            perPage: null == perPage
                ? _value.perPage
                : perPage // ignore: cast_nullable_to_non_nullable
                      as int,
            sortBy: null == sortBy
                ? _value.sortBy
                : sortBy // ignore: cast_nullable_to_non_nullable
                      as String,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostQueryDtoImplCopyWith<$Res>
    implements $PostQueryDtoCopyWith<$Res> {
  factory _$$PostQueryDtoImplCopyWith(
    _$PostQueryDtoImpl value,
    $Res Function(_$PostQueryDtoImpl) then,
  ) = __$$PostQueryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? search,
    PostStatus? status,
    @JsonKey(name: 'author_id') String? authorId,
    @JsonKey(name: 'category_id') String? categoryId,
    List<String>? tags,
    @JsonKey(name: 'is_featured') bool? isFeatured,
    int page,
    @JsonKey(name: 'per_page') int perPage,
    @JsonKey(name: 'sort_by') String sortBy,
    @JsonKey(name: 'sort_order') String sortOrder,
  });
}

/// @nodoc
class __$$PostQueryDtoImplCopyWithImpl<$Res>
    extends _$PostQueryDtoCopyWithImpl<$Res, _$PostQueryDtoImpl>
    implements _$$PostQueryDtoImplCopyWith<$Res> {
  __$$PostQueryDtoImplCopyWithImpl(
    _$PostQueryDtoImpl _value,
    $Res Function(_$PostQueryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostQueryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? status = freezed,
    Object? authorId = freezed,
    Object? categoryId = freezed,
    Object? tags = freezed,
    Object? isFeatured = freezed,
    Object? page = null,
    Object? perPage = null,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _$PostQueryDtoImpl(
        search: freezed == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PostStatus?,
        authorId: freezed == authorId
            ? _value.authorId
            : authorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        isFeatured: freezed == isFeatured
            ? _value.isFeatured
            : isFeatured // ignore: cast_nullable_to_non_nullable
                  as bool?,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        perPage: null == perPage
            ? _value.perPage
            : perPage // ignore: cast_nullable_to_non_nullable
                  as int,
        sortBy: null == sortBy
            ? _value.sortBy
            : sortBy // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostQueryDtoImpl extends _PostQueryDto {
  const _$PostQueryDtoImpl({
    this.search,
    this.status,
    @JsonKey(name: 'author_id') this.authorId,
    @JsonKey(name: 'category_id') this.categoryId,
    final List<String>? tags,
    @JsonKey(name: 'is_featured') this.isFeatured,
    this.page = 1,
    @JsonKey(name: 'per_page') this.perPage = 20,
    @JsonKey(name: 'sort_by') this.sortBy = 'created_at',
    @JsonKey(name: 'sort_order') this.sortOrder = 'desc',
  }) : _tags = tags,
       super._();

  factory _$PostQueryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostQueryDtoImplFromJson(json);

  @override
  final String? search;
  @override
  final PostStatus? status;
  @override
  @JsonKey(name: 'author_id')
  final String? authorId;
  @override
  @JsonKey(name: 'category_id')
  final String? categoryId;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_featured')
  final bool? isFeatured;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey(name: 'sort_by')
  final String sortBy;
  @override
  @JsonKey(name: 'sort_order')
  final String sortOrder;

  @override
  String toString() {
    return 'PostQueryDto(search: $search, status: $status, authorId: $authorId, categoryId: $categoryId, tags: $tags, isFeatured: $isFeatured, page: $page, perPage: $perPage, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostQueryDtoImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    search,
    status,
    authorId,
    categoryId,
    const DeepCollectionEquality().hash(_tags),
    isFeatured,
    page,
    perPage,
    sortBy,
    sortOrder,
  );

  /// Create a copy of PostQueryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostQueryDtoImplCopyWith<_$PostQueryDtoImpl> get copyWith =>
      __$$PostQueryDtoImplCopyWithImpl<_$PostQueryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostQueryDtoImplToJson(this);
  }
}

abstract class _PostQueryDto extends PostQueryDto {
  const factory _PostQueryDto({
    final String? search,
    final PostStatus? status,
    @JsonKey(name: 'author_id') final String? authorId,
    @JsonKey(name: 'category_id') final String? categoryId,
    final List<String>? tags,
    @JsonKey(name: 'is_featured') final bool? isFeatured,
    final int page,
    @JsonKey(name: 'per_page') final int perPage,
    @JsonKey(name: 'sort_by') final String sortBy,
    @JsonKey(name: 'sort_order') final String sortOrder,
  }) = _$PostQueryDtoImpl;
  const _PostQueryDto._() : super._();

  factory _PostQueryDto.fromJson(Map<String, dynamic> json) =
      _$PostQueryDtoImpl.fromJson;

  @override
  String? get search;
  @override
  PostStatus? get status;
  @override
  @JsonKey(name: 'author_id')
  String? get authorId;
  @override
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @override
  List<String>? get tags;
  @override
  @JsonKey(name: 'is_featured')
  bool? get isFeatured;
  @override
  int get page;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  @JsonKey(name: 'sort_by')
  String get sortBy;
  @override
  @JsonKey(name: 'sort_order')
  String get sortOrder;

  /// Create a copy of PostQueryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostQueryDtoImplCopyWith<_$PostQueryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
