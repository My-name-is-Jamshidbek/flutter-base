import 'package:flutter_test/flutter_test.dart';

import 'package:app_template/data/dto/api_response.dart';
import 'package:app_template/data/dto/post_dto.dart';

void main() {
  group('ApiResponse', () {
    test('fromJson parses generic data correctly', () {
      final json = {
        'data': {'id': '123', 'name': 'Test'},
        'success': true,
        'message': 'Success',
      };

      final response = ApiResponse<Map<String, dynamic>>.fromJson(
        json,
        (obj) => obj as Map<String, dynamic>,
      );

      expect(response.data['id'], '123');
      expect(response.success, true);
      expect(response.message, 'Success');
    });

    test('default success is true', () {
      final json = {'data': 'test'};

      final response = ApiResponse<String>.fromJson(
        json,
        (obj) => obj as String,
      );

      expect(response.success, true);
    });

    test('parses meta when present', () {
      final json = {
        'data': 'test',
        'meta': {
          'requestId': 'req-123',
          'timestamp': 1702656000,
          'version': 'v1',
        },
      };

      final response = ApiResponse<String>.fromJson(
        json,
        (obj) => obj as String,
      );

      expect(response.meta, isNotNull);
      expect(response.meta!.requestId, 'req-123');
      expect(response.meta!.timestamp, 1702656000);
      expect(response.meta!.version, 'v1');
    });
  });

  group('PaginatedResponse', () {
    test('fromJson parses list data correctly', () {
      final json = {
        'data': [
          {'id': 'post-1', 'title': 'First', 'content': 'C1', 'author_id': 'a'},
          {
            'id': 'post-2',
            'title': 'Second',
            'content': 'C2',
            'author_id': 'a',
          },
        ],
        'pagination': {'page': 1, 'perPage': 20, 'total': 100, 'totalPages': 5},
        'success': true,
      };

      final response = PaginatedResponse<PostDto>.fromJson(
        json,
        (obj) => PostDto.fromJson(obj as Map<String, dynamic>),
      );

      expect(response.data, hasLength(2));
      expect(response.data[0].id, 'post-1');
      expect(response.data[1].title, 'Second');
      expect(response.pagination.page, 1);
      expect(response.pagination.total, 100);
    });
  });

  group('PaginationMeta', () {
    test('fromJson parses correctly', () {
      final json = {
        'page': 2,
        'perPage': 20,
        'total': 100,
        'totalPages': 5,
        'hasMore': true,
      };

      final pagination = PaginationMeta.fromJson(json);

      expect(pagination.page, 2);
      expect(pagination.perPage, 20);
      expect(pagination.total, 100);
      expect(pagination.totalPages, 5);
      expect(pagination.hasMore, true);
    });

    group('computed properties', () {
      test('hasNextPage returns true when not on last page', () {
        const pagination = PaginationMeta(
          page: 2,
          perPage: 20,
          total: 100,
          totalPages: 5,
        );

        expect(pagination.hasNextPage, true);
      });

      test('hasNextPage returns false on last page', () {
        const pagination = PaginationMeta(
          page: 5,
          perPage: 20,
          total: 100,
          totalPages: 5,
        );

        expect(pagination.hasNextPage, false);
      });

      test('hasPreviousPage returns true when not on first page', () {
        const pagination = PaginationMeta(
          page: 2,
          perPage: 20,
          total: 100,
          totalPages: 5,
        );

        expect(pagination.hasPreviousPage, true);
      });

      test('hasPreviousPage returns false on first page', () {
        const pagination = PaginationMeta(
          page: 1,
          perPage: 20,
          total: 100,
          totalPages: 5,
        );

        expect(pagination.hasPreviousPage, false);
      });

      test('offset calculates correctly', () {
        const pagination = PaginationMeta(
          page: 3,
          perPage: 20,
          total: 100,
          totalPages: 5,
        );

        expect(pagination.offset, 40); // (3-1) * 20
      });

      test('offset is 0 on first page', () {
        const pagination = PaginationMeta(
          page: 1,
          perPage: 20,
          total: 100,
          totalPages: 5,
        );

        expect(pagination.offset, 0);
      });
    });
  });

  group('ApiError', () {
    test('fromJson parses basic error', () {
      final json = {
        'message': 'Something went wrong',
        'code': 'INTERNAL_ERROR',
        'statusCode': 500,
      };

      final error = ApiError.fromJson(json);

      expect(error.message, 'Something went wrong');
      expect(error.code, 'INTERNAL_ERROR');
      expect(error.statusCode, 500);
    });

    test('fromJson parses validation errors', () {
      final json = {
        'message': 'Validation failed',
        'code': 'VALIDATION_ERROR',
        'errors': {
          'email': ['Email is required', 'Email must be valid'],
          'password': ['Password is too short'],
        },
        'statusCode': 422,
      };

      final error = ApiError.fromJson(json);

      expect(error.message, 'Validation failed');
      expect(error.errors, isNotNull);
      expect(error.errors!['email'], hasLength(2));
      expect(error.errors!['password'], contains('Password is too short'));
    });
  });

  group('ApiMeta', () {
    test('fromJson parses all fields', () {
      final json = {
        'requestId': 'req-abc-123',
        'timestamp': 1702656000,
        'version': 'v2.0',
        'extra': {'serverTime': 1702656000},
      };

      final meta = ApiMeta.fromJson(json);

      expect(meta.requestId, 'req-abc-123');
      expect(meta.timestamp, 1702656000);
      expect(meta.version, 'v2.0');
      expect(meta.extra, isNotNull);
      expect(meta.extra!['serverTime'], 1702656000);
    });
  });
}
