import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Standard async state for data fetching operations.
///
/// Wraps [AsyncValue] with additional convenience methods for
/// handling loading, error, and data states.
typedef AsyncState<T> = AsyncValue<T>;

/// Pagination state for list data.
class PaginatedState<T> {
  final List<T> items;
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final bool isLoading;
  final bool isLoadingMore;
  final Object? error;
  final bool hasReachedEnd;

  const PaginatedState({
    this.items = const [],
    this.currentPage = 0,
    this.totalPages = 1,
    this.totalItems = 0,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.hasReachedEnd = false,
  });

  /// Whether the state is in initial loading state.
  bool get isInitialLoading => isLoading && items.isEmpty;

  /// Whether there are more items to load.
  bool get hasMore => currentPage < totalPages && !hasReachedEnd;

  /// Whether the state has data.
  bool get hasData => items.isNotEmpty;

  /// Whether the state has an error.
  bool get hasError => error != null;

  /// Whether the list is empty after loading.
  bool get isEmpty => items.isEmpty && !isLoading && !hasError;

  PaginatedState<T> copyWith({
    List<T>? items,
    int? currentPage,
    int? totalPages,
    int? totalItems,
    bool? isLoading,
    bool? isLoadingMore,
    Object? error,
    bool clearError = false,
    bool? hasReachedEnd,
  }) {
    return PaginatedState<T>(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: clearError ? null : (error ?? this.error),
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
    );
  }

  /// Create initial loading state.
  factory PaginatedState.loading() {
    return const PaginatedState(isLoading: true);
  }

  /// Create error state.
  factory PaginatedState.error(Object error) {
    return PaginatedState(error: error);
  }

  /// Create state with data.
  factory PaginatedState.data({
    required List<T> items,
    required int currentPage,
    required int totalPages,
    required int totalItems,
  }) {
    return PaginatedState(
      items: items,
      currentPage: currentPage,
      totalPages: totalPages,
      totalItems: totalItems,
      hasReachedEnd: currentPage >= totalPages,
    );
  }
}

/// Form state for handling form submissions.
class FormState<T> {
  final bool isSubmitting;
  final bool isSuccess;
  final T? data;
  final Object? error;
  final Map<String, String> fieldErrors;

  const FormState({
    this.isSubmitting = false,
    this.isSuccess = false,
    this.data,
    this.error,
    this.fieldErrors = const {},
  });

  /// Whether the form has a global error.
  bool get hasError => error != null;

  /// Whether the form has field-level errors.
  bool get hasFieldErrors => fieldErrors.isNotEmpty;

  /// Whether the form has any errors.
  bool get hasAnyError => hasError || hasFieldErrors;

  /// Get error for a specific field.
  String? getFieldError(String field) => fieldErrors[field];

  FormState<T> copyWith({
    bool? isSubmitting,
    bool? isSuccess,
    T? data,
    Object? error,
    bool clearError = false,
    Map<String, String>? fieldErrors,
  }) {
    return FormState<T>(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      data: data ?? this.data,
      error: clearError ? null : (error ?? this.error),
      fieldErrors: fieldErrors ?? this.fieldErrors,
    );
  }

  /// Create initial state.
  factory FormState.initial() => const FormState();

  /// Create submitting state.
  factory FormState.submitting() => const FormState(isSubmitting: true);

  /// Create success state.
  factory FormState.success([T? data]) {
    return FormState(isSuccess: true, data: data);
  }

  /// Create error state.
  factory FormState.error(Object error, {Map<String, String>? fieldErrors}) {
    return FormState(error: error, fieldErrors: fieldErrors ?? const {});
  }
}

/// Mutation state for single operations (create, update, delete).
class MutationState<T> {
  final bool isIdle;
  final bool isLoading;
  final bool isSuccess;
  final T? data;
  final Object? error;

  const MutationState._({
    this.isIdle = true,
    this.isLoading = false,
    this.isSuccess = false,
    this.data,
    this.error,
  });

  /// Whether the mutation has an error.
  bool get hasError => error != null;

  /// Whether the mutation has data.
  bool get hasData => data != null;

  /// Create idle state.
  const factory MutationState.idle() = MutationState<T>._;

  /// Create loading state.
  factory MutationState.loading() {
    return const MutationState._(isIdle: false, isLoading: true);
  }

  /// Create success state.
  factory MutationState.success([T? data]) {
    return MutationState._(isIdle: false, isSuccess: true, data: data);
  }

  /// Create error state.
  factory MutationState.error(Object error) {
    return MutationState._(isIdle: false, error: error);
  }

  MutationState<T> copyWith({
    bool? isIdle,
    bool? isLoading,
    bool? isSuccess,
    T? data,
    Object? error,
    bool clearError = false,
  }) {
    return MutationState._(
      isIdle: isIdle ?? this.isIdle,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      data: data ?? this.data,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

/// Extension on AsyncValue for common patterns.
extension AsyncValueExtensions<T> on AsyncValue<T> {
  /// Map all states with a single callback that receives the full AsyncValue.
  R when2<R>({
    required R Function(T data) data,
    required R Function(Object error, StackTrace stackTrace) error,
    required R Function() loading,
  }) {
    return when(data: data, error: error, loading: loading);
  }

  /// Handle the value or return a default.
  T valueOrDefault(T defaultValue) {
    return valueOrNull ?? defaultValue;
  }

  /// Check if the value matches a condition.
  bool hasValueWhere(bool Function(T value) predicate) {
    final val = valueOrNull;
    if (val == null) return false;
    return predicate(val);
  }

  /// Transform the value if present.
  AsyncValue<R> mapValue<R>(R Function(T value) transform) {
    return when(
      data: (value) => AsyncValue.data(transform(value)),
      error: AsyncValue.error,
      loading: AsyncValue.loading,
    );
  }
}

/// Extension on PaginatedState for common operations.
extension PaginatedStateExtensions<T> on PaginatedState<T> {
  /// Add more items to the list (for infinite scroll).
  PaginatedState<T> appendItems(
    List<T> newItems, {
    required int newPage,
    required int totalPages,
    required int totalItems,
  }) {
    return copyWith(
      items: [...items, ...newItems],
      currentPage: newPage,
      totalPages: totalPages,
      totalItems: totalItems,
      isLoadingMore: false,
      hasReachedEnd: newPage >= totalPages || newItems.isEmpty,
    );
  }

  /// Reset to initial state.
  PaginatedState<T> reset() {
    return const PaginatedState();
  }

  /// Start loading more items.
  PaginatedState<T> startLoadingMore() {
    return copyWith(isLoadingMore: true, clearError: true);
  }

  /// Set error state.
  PaginatedState<T> setError(Object error) {
    return copyWith(error: error, isLoading: false, isLoadingMore: false);
  }
}
