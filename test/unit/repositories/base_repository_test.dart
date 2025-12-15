import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

import 'package:app_template/core/network/failures.dart';
import 'package:app_template/core/network/result.dart';

void main() {
  group('Result extension methods', () {
    test('isSuccess returns true for right value', () {
      final result = Results.success<String>('test');

      expect(result.isSuccess, true);
      expect(result.isFailure, false);
    });

    test('isFailure returns true for left value', () {
      final result = Results.failure<String>(
        const Failure.unknown(message: 'Error'),
      );

      expect(result.isFailure, true);
      expect(result.isSuccess, false);
    });

    test('valueOrNull returns value on success', () {
      final result = Results.success<int>(42);

      expect(result.valueOrNull, 42);
    });

    test('valueOrNull returns null on failure', () {
      final result = Results.failure<int>(
        const Failure.unknown(message: 'Error'),
      );

      expect(result.valueOrNull, isNull);
    });

    test('failureOrNull returns failure on error', () {
      final result = Results.failure<String>(
        const Failure.network(message: 'No network'),
      );

      expect(result.failureOrNull, isNotNull);
      expect(result.failureOrNull!.message, 'No network');
    });

    test('failureOrNull returns null on success', () {
      final result = Results.success<String>('test');

      expect(result.failureOrNull, isNull);
    });

    test('valueOrThrow returns value on success', () {
      final result = Results.success<String>('value');

      expect(result.valueOrThrow, 'value');
    });

    test('valueOrThrow throws on failure', () {
      final result = Results.failure<String>(
        const Failure.unknown(message: 'Error'),
      );

      expect(() => result.valueOrThrow, throwsException);
    });

    test('onSuccess executes action for success', () {
      var called = false;
      final result = Results.success<String>('test');

      result.onSuccess((_) => called = true);

      expect(called, true);
    });

    test('onSuccess does not execute action for failure', () {
      var called = false;
      final result = Results.failure<String>(
        const Failure.unknown(message: 'Error'),
      );

      result.onSuccess((_) => called = true);

      expect(called, false);
    });

    test('onFailure executes action for failure', () {
      var called = false;
      final result = Results.failure<String>(
        const Failure.unknown(message: 'Error'),
      );

      result.onFailure((_) => called = true);

      expect(called, true);
    });

    test('mapValue transforms success value', () {
      final result = Results.success<int>(5);

      final mapped = result.mapValue((v) => v * 2);

      expect(mapped.valueOrNull, 10);
    });

    test('mapFailure transforms failure', () {
      final result = Results.failure<String>(
        const Failure.network(message: 'Original'),
      );

      final mapped = result.mapFailure(
        (f) => Failure.unknown(message: 'Mapped: ${f.message}'),
      );

      expect(mapped.failureOrNull!.message, 'Mapped: Original');
    });

    test('toNullable returns value on success', () {
      final result = Results.success<String>('test');

      expect(result.toNullable(), 'test');
    });

    test('toNullable returns null on failure', () {
      final result = Results.failure<String>(
        const Failure.unknown(message: 'Error'),
      );

      expect(result.toNullable(), isNull);
    });
  });

  group('Failure types', () {
    test('network failure properties', () {
      const failure = Failure.network(message: 'No connection');

      expect(failure.message, 'No connection');
      expect(
        failure.isRecoverable,
        false,
      ); // default isTimeout and isConnectionError are false
    });

    test('network failure with timeout is recoverable', () {
      const failure = Failure.network(message: 'Timeout', isTimeout: true);

      expect(failure.isRecoverable, true);
    });

    test('server failure properties', () {
      const failure = Failure.server(message: 'Server error', statusCode: 500);

      expect(failure.message, 'Server error');
      // Use pattern matching to access statusCode
      final statusCode = switch (failure) {
        ServerFailure(:final statusCode) => statusCode,
        _ => null,
      };
      expect(statusCode, 500);
    });

    test('unknown failure properties', () {
      const failure = Failure.unknown(message: 'Unknown error');

      expect(failure.message, 'Unknown error');
    });

    test('validation failure properties', () {
      const failure = Failure.validation(
        message: 'Invalid input',
        fieldErrors: {
          'email': ['Invalid email'],
        },
      );

      expect(failure.message, 'Invalid input');
      // Use pattern matching to access fieldErrors
      final errors = switch (failure) {
        ValidationFailure(:final fieldErrors) => fieldErrors,
        _ => null,
      };
      expect(errors, containsPair('email', ['Invalid email']));
    });

    test('auth failure requires auth when token expired', () {
      const failure = Failure.auth(
        message: 'Token expired',
        isTokenExpired: true,
      );

      expect(failure.requiresAuth, true);
    });

    test('auth failure requires auth when unauthorized', () {
      const failure = Failure.auth(
        message: 'Unauthorized',
        isUnauthorized: true,
      );

      expect(failure.requiresAuth, true);
    });
  });
}
