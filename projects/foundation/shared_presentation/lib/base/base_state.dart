import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

/// Base state cho tất cả UI states
///
/// Cung cấp common states:
/// - Initial: Trạng thái ban đầu
/// - Loading: Đang tải dữ liệu
/// - Success: Thành công với data
/// - Error: Có lỗi xảy ra
@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = InitialState<T>;
  const factory BaseState.loading() = LoadingState<T>;
  const factory BaseState.success(T data) = SuccessState<T>;
  const factory BaseState.error(String message, [Object? error]) =
      ErrorState<T>;
}

/// State cho list operations với pagination
@freezed
class ListState<T> with _$ListState<T> {
  const factory ListState.initial() = ListInitialState<T>;
  const factory ListState.loading() = ListLoadingState<T>;
  const factory ListState.loadingMore(List<T> items) = ListLoadingMoreState<T>;
  const factory ListState.success(
    List<T> items, {
    @Default(false) bool hasMore,
  }) = ListSuccessState<T>;
  const factory ListState.error(String message, [Object? error]) =
      ListErrorState<T>;
  const factory ListState.refreshing(List<T> items) = ListRefreshingState<T>;
}

/// State cho form operations
@freezed
class FormState<T> with _$FormState<T> {
  const factory FormState.initial() = FormInitialState<T>;
  const factory FormState.loading() = FormLoadingState<T>;
  const factory FormState.success(T data) = FormSuccessState<T>;
  const factory FormState.error(String message, [Object? error]) =
      FormErrorState<T>;
  const factory FormState.validationError(Map<String, String> errors) =
      FormValidationErrorState<T>;
}

/// State cho detail operations
@freezed
class DetailState<T> with _$DetailState<T> {
  const factory DetailState.initial() = DetailInitialState<T>;
  const factory DetailState.loading() = DetailLoadingState<T>;
  const factory DetailState.success(T data) = DetailSuccessState<T>;
  const factory DetailState.error(String message, [Object? error]) =
      DetailErrorState<T>;
  const factory DetailState.notFound() = DetailNotFoundState<T>;
}

/// State cho search operations
@freezed
class SearchState<T> with _$SearchState<T> {
  const factory SearchState.initial() = SearchInitialState<T>;
  const factory SearchState.searching() = SearchSearchingState<T>;
  const factory SearchState.success(List<T> results) = SearchSuccessState<T>;
  const factory SearchState.error(String message, [Object? error]) =
      SearchErrorState<T>;
  const factory SearchState.empty() = SearchEmptyState<T>;
}

/// State cho CRUD operations
@freezed
class CrudState<T> with _$CrudState<T> {
  const factory CrudState.initial() = CrudInitialState<T>;
  const factory CrudState.loading() = CrudLoadingState<T>;
  const factory CrudState.success(T data) = CrudSuccessState<T>;
  const factory CrudState.error(String message, [Object? error]) =
      CrudErrorState<T>;
  const factory CrudState.deleting() = CrudDeletingState<T>;
  const factory CrudState.deleted() = CrudDeletedState<T>;
  const factory CrudState.updating() = CrudUpdatingState<T>;
  const factory CrudState.updated(T data) = CrudUpdatedState<T>;
}
