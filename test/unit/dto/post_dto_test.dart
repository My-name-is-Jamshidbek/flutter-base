import 'package:flutter_test/flutter_test.dart';

import 'package:app_template/data/dto/post_dto.dart';

void main() {
  group('PostDto', () {
    group('fromJson', () {
      test('parses minimal required fields', () {
        final json = {
          'id': 'post-123',
          'title': 'Test Post',
          'content': 'This is test content',
          'author_id': 'author-456',
        };

        final post = PostDto.fromJson(json);

        expect(post.id, 'post-123');
        expect(post.title, 'Test Post');
        expect(post.content, 'This is test content');
        expect(post.authorId, 'author-456');
        expect(post.status, PostStatus.draft); // default
        expect(post.tags, isEmpty);
        expect(post.viewCount, 0);
        expect(post.likeCount, 0);
        expect(post.commentCount, 0);
      });

      test('parses all fields with snake_case mapping', () {
        final json = {
          'id': 'post-123',
          'title': 'Featured Article',
          'content': 'Long form content here...',
          'excerpt': 'Short excerpt',
          'featured_image': 'https://example.com/image.jpg',
          'author_id': 'author-456',
          'status': 'published',
          'tags': ['flutter', 'dart', 'mobile'],
          'view_count': 1500,
          'like_count': 234,
          'comment_count': 45,
          'is_featured': true,
          'is_pinned': true,
          'published_at': '2024-06-15T10:00:00.000Z',
          'created_at': '2024-06-01T08:00:00.000Z',
          'updated_at': '2024-06-15T10:00:00.000Z',
        };

        final post = PostDto.fromJson(json);

        expect(post.id, 'post-123');
        expect(post.title, 'Featured Article');
        expect(post.excerpt, 'Short excerpt');
        expect(post.featuredImage, 'https://example.com/image.jpg');
        expect(post.status, PostStatus.published);
        expect(post.tags, ['flutter', 'dart', 'mobile']);
        expect(post.viewCount, 1500);
        expect(post.likeCount, 234);
        expect(post.commentCount, 45);
        expect(post.isFeatured, true);
        expect(post.isPinned, true);
        expect(post.publishedAt, isA<DateTime>());
        expect(post.createdAt, isA<DateTime>());
        expect(post.updatedAt, isA<DateTime>());
      });

      test('parses nested categories', () {
        final json = {
          'id': 'post-123',
          'title': 'Test',
          'content': 'Content',
          'author_id': 'author-456',
          'categories': [
            {'id': 'cat-1', 'name': 'Technology', 'slug': 'technology'},
            {
              'id': 'cat-2',
              'name': 'Programming',
              'slug': 'programming',
              'post_count': 42,
            },
          ],
        };

        final post = PostDto.fromJson(json);

        expect(post.categories, hasLength(2));
        expect(post.categories[0].name, 'Technology');
        expect(post.categories[0].slug, 'technology');
        expect(post.categories[1].postCount, 42);
      });
    });

    group('toJson', () {
      test('serializes correctly', () {
        const post = PostDto(
          id: 'post-123',
          title: 'Test Post',
          content: 'Content here',
          authorId: 'author-456',
          status: PostStatus.published,
          isFeatured: true,
        );

        final json = post.toJson();

        expect(json['id'], 'post-123');
        expect(json['title'], 'Test Post');
        expect(json['author_id'], 'author-456');
        expect(json['status'], 'published');
        expect(json['is_featured'], true);
      });
    });

    group('computed properties', () {
      test('isPublished returns true for published posts', () {
        const post = PostDto(
          id: '1',
          title: 'Test',
          content: 'Content',
          authorId: 'a',
          status: PostStatus.published,
        );

        expect(post.isPublished, true);
        expect(post.isDraft, false);
      });

      test('isDraft returns true for draft posts', () {
        const post = PostDto(
          id: '1',
          title: 'Test',
          content: 'Content',
          authorId: 'a',
          status: PostStatus.draft,
        );

        expect(post.isDraft, true);
        expect(post.isPublished, false);
      });

      test('formattedViewCount formats thousands correctly', () {
        const post = PostDto(
          id: '1',
          title: 'Test',
          content: 'Content',
          authorId: 'a',
          viewCount: 1500,
        );

        expect(post.formattedViewCount, '1.5K');
      });

      test('formattedViewCount formats millions correctly', () {
        const post = PostDto(
          id: '1',
          title: 'Test',
          content: 'Content',
          authorId: 'a',
          viewCount: 2500000,
        );

        expect(post.formattedViewCount, '2.5M');
      });

      test('formattedViewCount shows raw count under 1000', () {
        const post = PostDto(
          id: '1',
          title: 'Test',
          content: 'Content',
          authorId: 'a',
          viewCount: 500,
        );

        expect(post.formattedViewCount, '500');
      });

      test('readingTimeMinutes calculates based on content length', () {
        // ~200 words = 1 minute
        final words = List.generate(400, (i) => 'word').join(' ');
        final post = PostDto(
          id: '1',
          title: 'Test',
          content: words,
          authorId: 'a',
        );

        expect(post.readingTimeMinutes, 2);
      });

      test('readingTimeMinutes is at least 1', () {
        const post = PostDto(
          id: '1',
          title: 'Test',
          content: 'Short',
          authorId: 'a',
        );

        expect(post.readingTimeMinutes, 1);
      });
    });
  });

  group('PostStatus', () {
    test('values map to correct strings', () {
      expect(PostStatus.draft.value, 'draft');
      expect(PostStatus.pending.value, 'pending');
      expect(PostStatus.published.value, 'published');
      expect(PostStatus.archived.value, 'archived');
    });
  });

  group('CategoryDto', () {
    test('fromJson parses correctly', () {
      final json = {
        'id': 'cat-123',
        'name': 'Technology',
        'slug': 'technology',
        'description': 'Tech related posts',
        'parent_id': 'parent-cat',
        'post_count': 42,
        'icon': 'laptop',
      };

      final category = CategoryDto.fromJson(json);

      expect(category.id, 'cat-123');
      expect(category.name, 'Technology');
      expect(category.slug, 'technology');
      expect(category.description, 'Tech related posts');
      expect(category.parentId, 'parent-cat');
      expect(category.postCount, 42);
      expect(category.icon, 'laptop');
    });

    test('default postCount is 0', () {
      final json = {'id': 'cat-1', 'name': 'Test', 'slug': 'test'};

      final category = CategoryDto.fromJson(json);

      expect(category.postCount, 0);
    });
  });
}
