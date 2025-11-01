// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BaseState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(SuccessState<T> value) success,
    required TResult Function(ErrorState<T> value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(SuccessState<T> value)? success,
    TResult? Function(ErrorState<T> value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(SuccessState<T> value)? success,
    TResult Function(ErrorState<T> value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<T, $Res> {
  factory $BaseStateCopyWith(
    BaseState<T> value,
    $Res Function(BaseState<T>) then,
  ) = _$BaseStateCopyWithImpl<T, $Res, BaseState<T>>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<T, $Res, $Val extends BaseState<T>>
    implements $BaseStateCopyWith<T, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<T, $Res> {
  factory _$$InitialStateImplCopyWith(
    _$InitialStateImpl<T> value,
    $Res Function(_$InitialStateImpl<T>) then,
  ) = __$$InitialStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$InitialStateImpl<T>>
    implements _$$InitialStateImplCopyWith<T, $Res> {
  __$$InitialStateImplCopyWithImpl(
    _$InitialStateImpl<T> _value,
    $Res Function(_$InitialStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialStateImpl<T> implements InitialState<T> {
  const _$InitialStateImpl();

  @override
  String toString() {
    return 'BaseState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(SuccessState<T> value) success,
    required TResult Function(ErrorState<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(SuccessState<T> value)? success,
    TResult? Function(ErrorState<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(SuccessState<T> value)? success,
    TResult Function(ErrorState<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialState<T> implements BaseState<T> {
  const factory InitialState() = _$InitialStateImpl<T>;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<T, $Res> {
  factory _$$LoadingStateImplCopyWith(
    _$LoadingStateImpl<T> value,
    $Res Function(_$LoadingStateImpl<T>) then,
  ) = __$$LoadingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$LoadingStateImpl<T>>
    implements _$$LoadingStateImplCopyWith<T, $Res> {
  __$$LoadingStateImplCopyWithImpl(
    _$LoadingStateImpl<T> _value,
    $Res Function(_$LoadingStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStateImpl<T> implements LoadingState<T> {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'BaseState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(SuccessState<T> value) success,
    required TResult Function(ErrorState<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(SuccessState<T> value)? success,
    TResult? Function(ErrorState<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(SuccessState<T> value)? success,
    TResult Function(ErrorState<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState<T> implements BaseState<T> {
  const factory LoadingState() = _$LoadingStateImpl<T>;
}

/// @nodoc
abstract class _$$SuccessStateImplCopyWith<T, $Res> {
  factory _$$SuccessStateImplCopyWith(
    _$SuccessStateImpl<T> value,
    $Res Function(_$SuccessStateImpl<T>) then,
  ) = __$$SuccessStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessStateImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$SuccessStateImpl<T>>
    implements _$$SuccessStateImplCopyWith<T, $Res> {
  __$$SuccessStateImplCopyWithImpl(
    _$SuccessStateImpl<T> _value,
    $Res Function(_$SuccessStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$SuccessStateImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T,
      ),
    );
  }
}

/// @nodoc

class _$SuccessStateImpl<T> implements SuccessState<T> {
  const _$SuccessStateImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'BaseState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessStateImplCopyWith<T, _$SuccessStateImpl<T>> get copyWith =>
      __$$SuccessStateImplCopyWithImpl<T, _$SuccessStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(SuccessState<T> value) success,
    required TResult Function(ErrorState<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(SuccessState<T> value)? success,
    TResult? Function(ErrorState<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(SuccessState<T> value)? success,
    TResult Function(ErrorState<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessState<T> implements BaseState<T> {
  const factory SuccessState(final T data) = _$SuccessStateImpl<T>;

  T get data;

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessStateImplCopyWith<T, _$SuccessStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<T, $Res> {
  factory _$$ErrorStateImplCopyWith(
    _$ErrorStateImpl<T> value,
    $Res Function(_$ErrorStateImpl<T>) then,
  ) = __$$ErrorStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, Object? error});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$ErrorStateImpl<T>>
    implements _$$ErrorStateImplCopyWith<T, $Res> {
  __$$ErrorStateImplCopyWithImpl(
    _$ErrorStateImpl<T> _value,
    $Res Function(_$ErrorStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? error = freezed}) {
    return _then(
      _$ErrorStateImpl<T>(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        freezed == error ? _value.error : error,
      ),
    );
  }
}

/// @nodoc

class _$ErrorStateImpl<T> implements ErrorState<T> {
  const _$ErrorStateImpl(this.message, [this.error]);

  @override
  final String message;
  @override
  final Object? error;

  @override
  String toString() {
    return 'BaseState<$T>.error(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(error),
  );

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<T, _$ErrorStateImpl<T>> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<T, _$ErrorStateImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
  }) {
    return error(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
  }) {
    return error?.call(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(SuccessState<T> value) success,
    required TResult Function(ErrorState<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(SuccessState<T> value)? success,
    TResult? Function(ErrorState<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(SuccessState<T> value)? success,
    TResult Function(ErrorState<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState<T> implements BaseState<T> {
  const factory ErrorState(final String message, [final Object? error]) =
      _$ErrorStateImpl<T>;

  String get message;
  Object? get error;

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorStateImplCopyWith<T, _$ErrorStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<T> items) loadingMore,
    required TResult Function(List<T> items, bool hasMore) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(List<T> items) refreshing,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<T> items)? loadingMore,
    TResult? Function(List<T> items, bool hasMore)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(List<T> items)? refreshing,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<T> items)? loadingMore,
    TResult Function(List<T> items, bool hasMore)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(List<T> items)? refreshing,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListInitialState<T> value) initial,
    required TResult Function(ListLoadingState<T> value) loading,
    required TResult Function(ListLoadingMoreState<T> value) loadingMore,
    required TResult Function(ListSuccessState<T> value) success,
    required TResult Function(ListErrorState<T> value) error,
    required TResult Function(ListRefreshingState<T> value) refreshing,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListInitialState<T> value)? initial,
    TResult? Function(ListLoadingState<T> value)? loading,
    TResult? Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult? Function(ListSuccessState<T> value)? success,
    TResult? Function(ListErrorState<T> value)? error,
    TResult? Function(ListRefreshingState<T> value)? refreshing,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListInitialState<T> value)? initial,
    TResult Function(ListLoadingState<T> value)? loading,
    TResult Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult Function(ListSuccessState<T> value)? success,
    TResult Function(ListErrorState<T> value)? error,
    TResult Function(ListRefreshingState<T> value)? refreshing,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListStateCopyWith<T, $Res> {
  factory $ListStateCopyWith(
    ListState<T> value,
    $Res Function(ListState<T>) then,
  ) = _$ListStateCopyWithImpl<T, $Res, ListState<T>>;
}

/// @nodoc
class _$ListStateCopyWithImpl<T, $Res, $Val extends ListState<T>>
    implements $ListStateCopyWith<T, $Res> {
  _$ListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ListInitialStateImplCopyWith<T, $Res> {
  factory _$$ListInitialStateImplCopyWith(
    _$ListInitialStateImpl<T> value,
    $Res Function(_$ListInitialStateImpl<T>) then,
  ) = __$$ListInitialStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ListInitialStateImplCopyWithImpl<T, $Res>
    extends _$ListStateCopyWithImpl<T, $Res, _$ListInitialStateImpl<T>>
    implements _$$ListInitialStateImplCopyWith<T, $Res> {
  __$$ListInitialStateImplCopyWithImpl(
    _$ListInitialStateImpl<T> _value,
    $Res Function(_$ListInitialStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ListInitialStateImpl<T> implements ListInitialState<T> {
  const _$ListInitialStateImpl();

  @override
  String toString() {
    return 'ListState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListInitialStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<T> items) loadingMore,
    required TResult Function(List<T> items, bool hasMore) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(List<T> items) refreshing,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<T> items)? loadingMore,
    TResult? Function(List<T> items, bool hasMore)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(List<T> items)? refreshing,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<T> items)? loadingMore,
    TResult Function(List<T> items, bool hasMore)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(List<T> items)? refreshing,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListInitialState<T> value) initial,
    required TResult Function(ListLoadingState<T> value) loading,
    required TResult Function(ListLoadingMoreState<T> value) loadingMore,
    required TResult Function(ListSuccessState<T> value) success,
    required TResult Function(ListErrorState<T> value) error,
    required TResult Function(ListRefreshingState<T> value) refreshing,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListInitialState<T> value)? initial,
    TResult? Function(ListLoadingState<T> value)? loading,
    TResult? Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult? Function(ListSuccessState<T> value)? success,
    TResult? Function(ListErrorState<T> value)? error,
    TResult? Function(ListRefreshingState<T> value)? refreshing,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListInitialState<T> value)? initial,
    TResult Function(ListLoadingState<T> value)? loading,
    TResult Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult Function(ListSuccessState<T> value)? success,
    TResult Function(ListErrorState<T> value)? error,
    TResult Function(ListRefreshingState<T> value)? refreshing,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ListInitialState<T> implements ListState<T> {
  const factory ListInitialState() = _$ListInitialStateImpl<T>;
}

/// @nodoc
abstract class _$$ListLoadingStateImplCopyWith<T, $Res> {
  factory _$$ListLoadingStateImplCopyWith(
    _$ListLoadingStateImpl<T> value,
    $Res Function(_$ListLoadingStateImpl<T>) then,
  ) = __$$ListLoadingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ListLoadingStateImplCopyWithImpl<T, $Res>
    extends _$ListStateCopyWithImpl<T, $Res, _$ListLoadingStateImpl<T>>
    implements _$$ListLoadingStateImplCopyWith<T, $Res> {
  __$$ListLoadingStateImplCopyWithImpl(
    _$ListLoadingStateImpl<T> _value,
    $Res Function(_$ListLoadingStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ListLoadingStateImpl<T> implements ListLoadingState<T> {
  const _$ListLoadingStateImpl();

  @override
  String toString() {
    return 'ListState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListLoadingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<T> items) loadingMore,
    required TResult Function(List<T> items, bool hasMore) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(List<T> items) refreshing,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<T> items)? loadingMore,
    TResult? Function(List<T> items, bool hasMore)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(List<T> items)? refreshing,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<T> items)? loadingMore,
    TResult Function(List<T> items, bool hasMore)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(List<T> items)? refreshing,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListInitialState<T> value) initial,
    required TResult Function(ListLoadingState<T> value) loading,
    required TResult Function(ListLoadingMoreState<T> value) loadingMore,
    required TResult Function(ListSuccessState<T> value) success,
    required TResult Function(ListErrorState<T> value) error,
    required TResult Function(ListRefreshingState<T> value) refreshing,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListInitialState<T> value)? initial,
    TResult? Function(ListLoadingState<T> value)? loading,
    TResult? Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult? Function(ListSuccessState<T> value)? success,
    TResult? Function(ListErrorState<T> value)? error,
    TResult? Function(ListRefreshingState<T> value)? refreshing,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListInitialState<T> value)? initial,
    TResult Function(ListLoadingState<T> value)? loading,
    TResult Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult Function(ListSuccessState<T> value)? success,
    TResult Function(ListErrorState<T> value)? error,
    TResult Function(ListRefreshingState<T> value)? refreshing,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ListLoadingState<T> implements ListState<T> {
  const factory ListLoadingState() = _$ListLoadingStateImpl<T>;
}

/// @nodoc
abstract class _$$ListLoadingMoreStateImplCopyWith<T, $Res> {
  factory _$$ListLoadingMoreStateImplCopyWith(
    _$ListLoadingMoreStateImpl<T> value,
    $Res Function(_$ListLoadingMoreStateImpl<T>) then,
  ) = __$$ListLoadingMoreStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class __$$ListLoadingMoreStateImplCopyWithImpl<T, $Res>
    extends _$ListStateCopyWithImpl<T, $Res, _$ListLoadingMoreStateImpl<T>>
    implements _$$ListLoadingMoreStateImplCopyWith<T, $Res> {
  __$$ListLoadingMoreStateImplCopyWithImpl(
    _$ListLoadingMoreStateImpl<T> _value,
    $Res Function(_$ListLoadingMoreStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$ListLoadingMoreStateImpl<T>(
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc

class _$ListLoadingMoreStateImpl<T> implements ListLoadingMoreState<T> {
  const _$ListLoadingMoreStateImpl(final List<T> items) : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ListState<$T>.loadingMore(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListLoadingMoreStateImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListLoadingMoreStateImplCopyWith<T, _$ListLoadingMoreStateImpl<T>>
  get copyWith =>
      __$$ListLoadingMoreStateImplCopyWithImpl<
        T,
        _$ListLoadingMoreStateImpl<T>
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<T> items) loadingMore,
    required TResult Function(List<T> items, bool hasMore) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(List<T> items) refreshing,
  }) {
    return loadingMore(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<T> items)? loadingMore,
    TResult? Function(List<T> items, bool hasMore)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(List<T> items)? refreshing,
  }) {
    return loadingMore?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<T> items)? loadingMore,
    TResult Function(List<T> items, bool hasMore)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(List<T> items)? refreshing,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListInitialState<T> value) initial,
    required TResult Function(ListLoadingState<T> value) loading,
    required TResult Function(ListLoadingMoreState<T> value) loadingMore,
    required TResult Function(ListSuccessState<T> value) success,
    required TResult Function(ListErrorState<T> value) error,
    required TResult Function(ListRefreshingState<T> value) refreshing,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListInitialState<T> value)? initial,
    TResult? Function(ListLoadingState<T> value)? loading,
    TResult? Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult? Function(ListSuccessState<T> value)? success,
    TResult? Function(ListErrorState<T> value)? error,
    TResult? Function(ListRefreshingState<T> value)? refreshing,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListInitialState<T> value)? initial,
    TResult Function(ListLoadingState<T> value)? loading,
    TResult Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult Function(ListSuccessState<T> value)? success,
    TResult Function(ListErrorState<T> value)? error,
    TResult Function(ListRefreshingState<T> value)? refreshing,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class ListLoadingMoreState<T> implements ListState<T> {
  const factory ListLoadingMoreState(final List<T> items) =
      _$ListLoadingMoreStateImpl<T>;

  List<T> get items;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListLoadingMoreStateImplCopyWith<T, _$ListLoadingMoreStateImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListSuccessStateImplCopyWith<T, $Res> {
  factory _$$ListSuccessStateImplCopyWith(
    _$ListSuccessStateImpl<T> value,
    $Res Function(_$ListSuccessStateImpl<T>) then,
  ) = __$$ListSuccessStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> items, bool hasMore});
}

/// @nodoc
class __$$ListSuccessStateImplCopyWithImpl<T, $Res>
    extends _$ListStateCopyWithImpl<T, $Res, _$ListSuccessStateImpl<T>>
    implements _$$ListSuccessStateImplCopyWith<T, $Res> {
  __$$ListSuccessStateImplCopyWithImpl(
    _$ListSuccessStateImpl<T> _value,
    $Res Function(_$ListSuccessStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null, Object? hasMore = null}) {
    return _then(
      _$ListSuccessStateImpl<T>(
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ListSuccessStateImpl<T> implements ListSuccessState<T> {
  const _$ListSuccessStateImpl(final List<T> items, {this.hasMore = false})
    : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool hasMore;

  @override
  String toString() {
    return 'ListState<$T>.success(items: $items, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListSuccessStateImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    hasMore,
  );

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListSuccessStateImplCopyWith<T, _$ListSuccessStateImpl<T>> get copyWith =>
      __$$ListSuccessStateImplCopyWithImpl<T, _$ListSuccessStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<T> items) loadingMore,
    required TResult Function(List<T> items, bool hasMore) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(List<T> items) refreshing,
  }) {
    return success(items, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<T> items)? loadingMore,
    TResult? Function(List<T> items, bool hasMore)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(List<T> items)? refreshing,
  }) {
    return success?.call(items, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<T> items)? loadingMore,
    TResult Function(List<T> items, bool hasMore)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(List<T> items)? refreshing,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(items, hasMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListInitialState<T> value) initial,
    required TResult Function(ListLoadingState<T> value) loading,
    required TResult Function(ListLoadingMoreState<T> value) loadingMore,
    required TResult Function(ListSuccessState<T> value) success,
    required TResult Function(ListErrorState<T> value) error,
    required TResult Function(ListRefreshingState<T> value) refreshing,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListInitialState<T> value)? initial,
    TResult? Function(ListLoadingState<T> value)? loading,
    TResult? Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult? Function(ListSuccessState<T> value)? success,
    TResult? Function(ListErrorState<T> value)? error,
    TResult? Function(ListRefreshingState<T> value)? refreshing,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListInitialState<T> value)? initial,
    TResult Function(ListLoadingState<T> value)? loading,
    TResult Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult Function(ListSuccessState<T> value)? success,
    TResult Function(ListErrorState<T> value)? error,
    TResult Function(ListRefreshingState<T> value)? refreshing,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ListSuccessState<T> implements ListState<T> {
  const factory ListSuccessState(final List<T> items, {final bool hasMore}) =
      _$ListSuccessStateImpl<T>;

  List<T> get items;
  bool get hasMore;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListSuccessStateImplCopyWith<T, _$ListSuccessStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListErrorStateImplCopyWith<T, $Res> {
  factory _$$ListErrorStateImplCopyWith(
    _$ListErrorStateImpl<T> value,
    $Res Function(_$ListErrorStateImpl<T>) then,
  ) = __$$ListErrorStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, Object? error});
}

/// @nodoc
class __$$ListErrorStateImplCopyWithImpl<T, $Res>
    extends _$ListStateCopyWithImpl<T, $Res, _$ListErrorStateImpl<T>>
    implements _$$ListErrorStateImplCopyWith<T, $Res> {
  __$$ListErrorStateImplCopyWithImpl(
    _$ListErrorStateImpl<T> _value,
    $Res Function(_$ListErrorStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? error = freezed}) {
    return _then(
      _$ListErrorStateImpl<T>(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        freezed == error ? _value.error : error,
      ),
    );
  }
}

/// @nodoc

class _$ListErrorStateImpl<T> implements ListErrorState<T> {
  const _$ListErrorStateImpl(this.message, [this.error]);

  @override
  final String message;
  @override
  final Object? error;

  @override
  String toString() {
    return 'ListState<$T>.error(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListErrorStateImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(error),
  );

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListErrorStateImplCopyWith<T, _$ListErrorStateImpl<T>> get copyWith =>
      __$$ListErrorStateImplCopyWithImpl<T, _$ListErrorStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<T> items) loadingMore,
    required TResult Function(List<T> items, bool hasMore) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(List<T> items) refreshing,
  }) {
    return error(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<T> items)? loadingMore,
    TResult? Function(List<T> items, bool hasMore)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(List<T> items)? refreshing,
  }) {
    return error?.call(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<T> items)? loadingMore,
    TResult Function(List<T> items, bool hasMore)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(List<T> items)? refreshing,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListInitialState<T> value) initial,
    required TResult Function(ListLoadingState<T> value) loading,
    required TResult Function(ListLoadingMoreState<T> value) loadingMore,
    required TResult Function(ListSuccessState<T> value) success,
    required TResult Function(ListErrorState<T> value) error,
    required TResult Function(ListRefreshingState<T> value) refreshing,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListInitialState<T> value)? initial,
    TResult? Function(ListLoadingState<T> value)? loading,
    TResult? Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult? Function(ListSuccessState<T> value)? success,
    TResult? Function(ListErrorState<T> value)? error,
    TResult? Function(ListRefreshingState<T> value)? refreshing,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListInitialState<T> value)? initial,
    TResult Function(ListLoadingState<T> value)? loading,
    TResult Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult Function(ListSuccessState<T> value)? success,
    TResult Function(ListErrorState<T> value)? error,
    TResult Function(ListRefreshingState<T> value)? refreshing,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ListErrorState<T> implements ListState<T> {
  const factory ListErrorState(final String message, [final Object? error]) =
      _$ListErrorStateImpl<T>;

  String get message;
  Object? get error;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListErrorStateImplCopyWith<T, _$ListErrorStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListRefreshingStateImplCopyWith<T, $Res> {
  factory _$$ListRefreshingStateImplCopyWith(
    _$ListRefreshingStateImpl<T> value,
    $Res Function(_$ListRefreshingStateImpl<T>) then,
  ) = __$$ListRefreshingStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class __$$ListRefreshingStateImplCopyWithImpl<T, $Res>
    extends _$ListStateCopyWithImpl<T, $Res, _$ListRefreshingStateImpl<T>>
    implements _$$ListRefreshingStateImplCopyWith<T, $Res> {
  __$$ListRefreshingStateImplCopyWithImpl(
    _$ListRefreshingStateImpl<T> _value,
    $Res Function(_$ListRefreshingStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$ListRefreshingStateImpl<T>(
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc

class _$ListRefreshingStateImpl<T> implements ListRefreshingState<T> {
  const _$ListRefreshingStateImpl(final List<T> items) : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ListState<$T>.refreshing(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListRefreshingStateImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListRefreshingStateImplCopyWith<T, _$ListRefreshingStateImpl<T>>
  get copyWith =>
      __$$ListRefreshingStateImplCopyWithImpl<T, _$ListRefreshingStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<T> items) loadingMore,
    required TResult Function(List<T> items, bool hasMore) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(List<T> items) refreshing,
  }) {
    return refreshing(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<T> items)? loadingMore,
    TResult? Function(List<T> items, bool hasMore)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(List<T> items)? refreshing,
  }) {
    return refreshing?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<T> items)? loadingMore,
    TResult Function(List<T> items, bool hasMore)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(List<T> items)? refreshing,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListInitialState<T> value) initial,
    required TResult Function(ListLoadingState<T> value) loading,
    required TResult Function(ListLoadingMoreState<T> value) loadingMore,
    required TResult Function(ListSuccessState<T> value) success,
    required TResult Function(ListErrorState<T> value) error,
    required TResult Function(ListRefreshingState<T> value) refreshing,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListInitialState<T> value)? initial,
    TResult? Function(ListLoadingState<T> value)? loading,
    TResult? Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult? Function(ListSuccessState<T> value)? success,
    TResult? Function(ListErrorState<T> value)? error,
    TResult? Function(ListRefreshingState<T> value)? refreshing,
  }) {
    return refreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListInitialState<T> value)? initial,
    TResult Function(ListLoadingState<T> value)? loading,
    TResult Function(ListLoadingMoreState<T> value)? loadingMore,
    TResult Function(ListSuccessState<T> value)? success,
    TResult Function(ListErrorState<T> value)? error,
    TResult Function(ListRefreshingState<T> value)? refreshing,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class ListRefreshingState<T> implements ListState<T> {
  const factory ListRefreshingState(final List<T> items) =
      _$ListRefreshingStateImpl<T>;

  List<T> get items;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListRefreshingStateImplCopyWith<T, _$ListRefreshingStateImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FormState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(Map<String, String> errors) validationError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(Map<String, String> errors)? validationError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(Map<String, String> errors)? validationError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInitialState<T> value) initial,
    required TResult Function(FormLoadingState<T> value) loading,
    required TResult Function(FormSuccessState<T> value) success,
    required TResult Function(FormErrorState<T> value) error,
    required TResult Function(FormValidationErrorState<T> value)
    validationError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInitialState<T> value)? initial,
    TResult? Function(FormLoadingState<T> value)? loading,
    TResult? Function(FormSuccessState<T> value)? success,
    TResult? Function(FormErrorState<T> value)? error,
    TResult? Function(FormValidationErrorState<T> value)? validationError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInitialState<T> value)? initial,
    TResult Function(FormLoadingState<T> value)? loading,
    TResult Function(FormSuccessState<T> value)? success,
    TResult Function(FormErrorState<T> value)? error,
    TResult Function(FormValidationErrorState<T> value)? validationError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormStateCopyWith<T, $Res> {
  factory $FormStateCopyWith(
    FormState<T> value,
    $Res Function(FormState<T>) then,
  ) = _$FormStateCopyWithImpl<T, $Res, FormState<T>>;
}

/// @nodoc
class _$FormStateCopyWithImpl<T, $Res, $Val extends FormState<T>>
    implements $FormStateCopyWith<T, $Res> {
  _$FormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FormInitialStateImplCopyWith<T, $Res> {
  factory _$$FormInitialStateImplCopyWith(
    _$FormInitialStateImpl<T> value,
    $Res Function(_$FormInitialStateImpl<T>) then,
  ) = __$$FormInitialStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$FormInitialStateImplCopyWithImpl<T, $Res>
    extends _$FormStateCopyWithImpl<T, $Res, _$FormInitialStateImpl<T>>
    implements _$$FormInitialStateImplCopyWith<T, $Res> {
  __$$FormInitialStateImplCopyWithImpl(
    _$FormInitialStateImpl<T> _value,
    $Res Function(_$FormInitialStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FormInitialStateImpl<T> implements FormInitialState<T> {
  const _$FormInitialStateImpl();

  @override
  String toString() {
    return 'FormState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInitialStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(Map<String, String> errors) validationError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(Map<String, String> errors)? validationError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(Map<String, String> errors)? validationError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInitialState<T> value) initial,
    required TResult Function(FormLoadingState<T> value) loading,
    required TResult Function(FormSuccessState<T> value) success,
    required TResult Function(FormErrorState<T> value) error,
    required TResult Function(FormValidationErrorState<T> value)
    validationError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInitialState<T> value)? initial,
    TResult? Function(FormLoadingState<T> value)? loading,
    TResult? Function(FormSuccessState<T> value)? success,
    TResult? Function(FormErrorState<T> value)? error,
    TResult? Function(FormValidationErrorState<T> value)? validationError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInitialState<T> value)? initial,
    TResult Function(FormLoadingState<T> value)? loading,
    TResult Function(FormSuccessState<T> value)? success,
    TResult Function(FormErrorState<T> value)? error,
    TResult Function(FormValidationErrorState<T> value)? validationError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FormInitialState<T> implements FormState<T> {
  const factory FormInitialState() = _$FormInitialStateImpl<T>;
}

/// @nodoc
abstract class _$$FormLoadingStateImplCopyWith<T, $Res> {
  factory _$$FormLoadingStateImplCopyWith(
    _$FormLoadingStateImpl<T> value,
    $Res Function(_$FormLoadingStateImpl<T>) then,
  ) = __$$FormLoadingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$FormLoadingStateImplCopyWithImpl<T, $Res>
    extends _$FormStateCopyWithImpl<T, $Res, _$FormLoadingStateImpl<T>>
    implements _$$FormLoadingStateImplCopyWith<T, $Res> {
  __$$FormLoadingStateImplCopyWithImpl(
    _$FormLoadingStateImpl<T> _value,
    $Res Function(_$FormLoadingStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FormLoadingStateImpl<T> implements FormLoadingState<T> {
  const _$FormLoadingStateImpl();

  @override
  String toString() {
    return 'FormState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormLoadingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(Map<String, String> errors) validationError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(Map<String, String> errors)? validationError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(Map<String, String> errors)? validationError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInitialState<T> value) initial,
    required TResult Function(FormLoadingState<T> value) loading,
    required TResult Function(FormSuccessState<T> value) success,
    required TResult Function(FormErrorState<T> value) error,
    required TResult Function(FormValidationErrorState<T> value)
    validationError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInitialState<T> value)? initial,
    TResult? Function(FormLoadingState<T> value)? loading,
    TResult? Function(FormSuccessState<T> value)? success,
    TResult? Function(FormErrorState<T> value)? error,
    TResult? Function(FormValidationErrorState<T> value)? validationError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInitialState<T> value)? initial,
    TResult Function(FormLoadingState<T> value)? loading,
    TResult Function(FormSuccessState<T> value)? success,
    TResult Function(FormErrorState<T> value)? error,
    TResult Function(FormValidationErrorState<T> value)? validationError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FormLoadingState<T> implements FormState<T> {
  const factory FormLoadingState() = _$FormLoadingStateImpl<T>;
}

/// @nodoc
abstract class _$$FormSuccessStateImplCopyWith<T, $Res> {
  factory _$$FormSuccessStateImplCopyWith(
    _$FormSuccessStateImpl<T> value,
    $Res Function(_$FormSuccessStateImpl<T>) then,
  ) = __$$FormSuccessStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$FormSuccessStateImplCopyWithImpl<T, $Res>
    extends _$FormStateCopyWithImpl<T, $Res, _$FormSuccessStateImpl<T>>
    implements _$$FormSuccessStateImplCopyWith<T, $Res> {
  __$$FormSuccessStateImplCopyWithImpl(
    _$FormSuccessStateImpl<T> _value,
    $Res Function(_$FormSuccessStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$FormSuccessStateImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T,
      ),
    );
  }
}

/// @nodoc

class _$FormSuccessStateImpl<T> implements FormSuccessState<T> {
  const _$FormSuccessStateImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'FormState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormSuccessStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormSuccessStateImplCopyWith<T, _$FormSuccessStateImpl<T>> get copyWith =>
      __$$FormSuccessStateImplCopyWithImpl<T, _$FormSuccessStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(Map<String, String> errors) validationError,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(Map<String, String> errors)? validationError,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(Map<String, String> errors)? validationError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInitialState<T> value) initial,
    required TResult Function(FormLoadingState<T> value) loading,
    required TResult Function(FormSuccessState<T> value) success,
    required TResult Function(FormErrorState<T> value) error,
    required TResult Function(FormValidationErrorState<T> value)
    validationError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInitialState<T> value)? initial,
    TResult? Function(FormLoadingState<T> value)? loading,
    TResult? Function(FormSuccessState<T> value)? success,
    TResult? Function(FormErrorState<T> value)? error,
    TResult? Function(FormValidationErrorState<T> value)? validationError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInitialState<T> value)? initial,
    TResult Function(FormLoadingState<T> value)? loading,
    TResult Function(FormSuccessState<T> value)? success,
    TResult Function(FormErrorState<T> value)? error,
    TResult Function(FormValidationErrorState<T> value)? validationError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FormSuccessState<T> implements FormState<T> {
  const factory FormSuccessState(final T data) = _$FormSuccessStateImpl<T>;

  T get data;

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormSuccessStateImplCopyWith<T, _$FormSuccessStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormErrorStateImplCopyWith<T, $Res> {
  factory _$$FormErrorStateImplCopyWith(
    _$FormErrorStateImpl<T> value,
    $Res Function(_$FormErrorStateImpl<T>) then,
  ) = __$$FormErrorStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, Object? error});
}

/// @nodoc
class __$$FormErrorStateImplCopyWithImpl<T, $Res>
    extends _$FormStateCopyWithImpl<T, $Res, _$FormErrorStateImpl<T>>
    implements _$$FormErrorStateImplCopyWith<T, $Res> {
  __$$FormErrorStateImplCopyWithImpl(
    _$FormErrorStateImpl<T> _value,
    $Res Function(_$FormErrorStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? error = freezed}) {
    return _then(
      _$FormErrorStateImpl<T>(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        freezed == error ? _value.error : error,
      ),
    );
  }
}

/// @nodoc

class _$FormErrorStateImpl<T> implements FormErrorState<T> {
  const _$FormErrorStateImpl(this.message, [this.error]);

  @override
  final String message;
  @override
  final Object? error;

  @override
  String toString() {
    return 'FormState<$T>.error(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormErrorStateImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(error),
  );

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormErrorStateImplCopyWith<T, _$FormErrorStateImpl<T>> get copyWith =>
      __$$FormErrorStateImplCopyWithImpl<T, _$FormErrorStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(Map<String, String> errors) validationError,
  }) {
    return error(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(Map<String, String> errors)? validationError,
  }) {
    return error?.call(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(Map<String, String> errors)? validationError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInitialState<T> value) initial,
    required TResult Function(FormLoadingState<T> value) loading,
    required TResult Function(FormSuccessState<T> value) success,
    required TResult Function(FormErrorState<T> value) error,
    required TResult Function(FormValidationErrorState<T> value)
    validationError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInitialState<T> value)? initial,
    TResult? Function(FormLoadingState<T> value)? loading,
    TResult? Function(FormSuccessState<T> value)? success,
    TResult? Function(FormErrorState<T> value)? error,
    TResult? Function(FormValidationErrorState<T> value)? validationError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInitialState<T> value)? initial,
    TResult Function(FormLoadingState<T> value)? loading,
    TResult Function(FormSuccessState<T> value)? success,
    TResult Function(FormErrorState<T> value)? error,
    TResult Function(FormValidationErrorState<T> value)? validationError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FormErrorState<T> implements FormState<T> {
  const factory FormErrorState(final String message, [final Object? error]) =
      _$FormErrorStateImpl<T>;

  String get message;
  Object? get error;

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormErrorStateImplCopyWith<T, _$FormErrorStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormValidationErrorStateImplCopyWith<T, $Res> {
  factory _$$FormValidationErrorStateImplCopyWith(
    _$FormValidationErrorStateImpl<T> value,
    $Res Function(_$FormValidationErrorStateImpl<T>) then,
  ) = __$$FormValidationErrorStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Map<String, String> errors});
}

/// @nodoc
class __$$FormValidationErrorStateImplCopyWithImpl<T, $Res>
    extends _$FormStateCopyWithImpl<T, $Res, _$FormValidationErrorStateImpl<T>>
    implements _$$FormValidationErrorStateImplCopyWith<T, $Res> {
  __$$FormValidationErrorStateImplCopyWithImpl(
    _$FormValidationErrorStateImpl<T> _value,
    $Res Function(_$FormValidationErrorStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errors = null}) {
    return _then(
      _$FormValidationErrorStateImpl<T>(
        null == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
      ),
    );
  }
}

/// @nodoc

class _$FormValidationErrorStateImpl<T> implements FormValidationErrorState<T> {
  const _$FormValidationErrorStateImpl(final Map<String, String> errors)
    : _errors = errors;

  final Map<String, String> _errors;
  @override
  Map<String, String> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @override
  String toString() {
    return 'FormState<$T>.validationError(errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormValidationErrorStateImpl<T> &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormValidationErrorStateImplCopyWith<T, _$FormValidationErrorStateImpl<T>>
  get copyWith =>
      __$$FormValidationErrorStateImplCopyWithImpl<
        T,
        _$FormValidationErrorStateImpl<T>
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(Map<String, String> errors) validationError,
  }) {
    return validationError(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(Map<String, String> errors)? validationError,
  }) {
    return validationError?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(Map<String, String> errors)? validationError,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInitialState<T> value) initial,
    required TResult Function(FormLoadingState<T> value) loading,
    required TResult Function(FormSuccessState<T> value) success,
    required TResult Function(FormErrorState<T> value) error,
    required TResult Function(FormValidationErrorState<T> value)
    validationError,
  }) {
    return validationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInitialState<T> value)? initial,
    TResult? Function(FormLoadingState<T> value)? loading,
    TResult? Function(FormSuccessState<T> value)? success,
    TResult? Function(FormErrorState<T> value)? error,
    TResult? Function(FormValidationErrorState<T> value)? validationError,
  }) {
    return validationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInitialState<T> value)? initial,
    TResult Function(FormLoadingState<T> value)? loading,
    TResult Function(FormSuccessState<T> value)? success,
    TResult Function(FormErrorState<T> value)? error,
    TResult Function(FormValidationErrorState<T> value)? validationError,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(this);
    }
    return orElse();
  }
}

abstract class FormValidationErrorState<T> implements FormState<T> {
  const factory FormValidationErrorState(final Map<String, String> errors) =
      _$FormValidationErrorStateImpl<T>;

  Map<String, String> get errors;

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormValidationErrorStateImplCopyWith<T, _$FormValidationErrorStateImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() notFound,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? notFound,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? notFound,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailInitialState<T> value) initial,
    required TResult Function(DetailLoadingState<T> value) loading,
    required TResult Function(DetailSuccessState<T> value) success,
    required TResult Function(DetailErrorState<T> value) error,
    required TResult Function(DetailNotFoundState<T> value) notFound,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailInitialState<T> value)? initial,
    TResult? Function(DetailLoadingState<T> value)? loading,
    TResult? Function(DetailSuccessState<T> value)? success,
    TResult? Function(DetailErrorState<T> value)? error,
    TResult? Function(DetailNotFoundState<T> value)? notFound,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailInitialState<T> value)? initial,
    TResult Function(DetailLoadingState<T> value)? loading,
    TResult Function(DetailSuccessState<T> value)? success,
    TResult Function(DetailErrorState<T> value)? error,
    TResult Function(DetailNotFoundState<T> value)? notFound,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStateCopyWith<T, $Res> {
  factory $DetailStateCopyWith(
    DetailState<T> value,
    $Res Function(DetailState<T>) then,
  ) = _$DetailStateCopyWithImpl<T, $Res, DetailState<T>>;
}

/// @nodoc
class _$DetailStateCopyWithImpl<T, $Res, $Val extends DetailState<T>>
    implements $DetailStateCopyWith<T, $Res> {
  _$DetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DetailInitialStateImplCopyWith<T, $Res> {
  factory _$$DetailInitialStateImplCopyWith(
    _$DetailInitialStateImpl<T> value,
    $Res Function(_$DetailInitialStateImpl<T>) then,
  ) = __$$DetailInitialStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$DetailInitialStateImplCopyWithImpl<T, $Res>
    extends _$DetailStateCopyWithImpl<T, $Res, _$DetailInitialStateImpl<T>>
    implements _$$DetailInitialStateImplCopyWith<T, $Res> {
  __$$DetailInitialStateImplCopyWithImpl(
    _$DetailInitialStateImpl<T> _value,
    $Res Function(_$DetailInitialStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetailInitialStateImpl<T> implements DetailInitialState<T> {
  const _$DetailInitialStateImpl();

  @override
  String toString() {
    return 'DetailState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailInitialStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() notFound,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? notFound,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailInitialState<T> value) initial,
    required TResult Function(DetailLoadingState<T> value) loading,
    required TResult Function(DetailSuccessState<T> value) success,
    required TResult Function(DetailErrorState<T> value) error,
    required TResult Function(DetailNotFoundState<T> value) notFound,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailInitialState<T> value)? initial,
    TResult? Function(DetailLoadingState<T> value)? loading,
    TResult? Function(DetailSuccessState<T> value)? success,
    TResult? Function(DetailErrorState<T> value)? error,
    TResult? Function(DetailNotFoundState<T> value)? notFound,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailInitialState<T> value)? initial,
    TResult Function(DetailLoadingState<T> value)? loading,
    TResult Function(DetailSuccessState<T> value)? success,
    TResult Function(DetailErrorState<T> value)? error,
    TResult Function(DetailNotFoundState<T> value)? notFound,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DetailInitialState<T> implements DetailState<T> {
  const factory DetailInitialState() = _$DetailInitialStateImpl<T>;
}

/// @nodoc
abstract class _$$DetailLoadingStateImplCopyWith<T, $Res> {
  factory _$$DetailLoadingStateImplCopyWith(
    _$DetailLoadingStateImpl<T> value,
    $Res Function(_$DetailLoadingStateImpl<T>) then,
  ) = __$$DetailLoadingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$DetailLoadingStateImplCopyWithImpl<T, $Res>
    extends _$DetailStateCopyWithImpl<T, $Res, _$DetailLoadingStateImpl<T>>
    implements _$$DetailLoadingStateImplCopyWith<T, $Res> {
  __$$DetailLoadingStateImplCopyWithImpl(
    _$DetailLoadingStateImpl<T> _value,
    $Res Function(_$DetailLoadingStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetailLoadingStateImpl<T> implements DetailLoadingState<T> {
  const _$DetailLoadingStateImpl();

  @override
  String toString() {
    return 'DetailState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailLoadingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() notFound,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? notFound,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailInitialState<T> value) initial,
    required TResult Function(DetailLoadingState<T> value) loading,
    required TResult Function(DetailSuccessState<T> value) success,
    required TResult Function(DetailErrorState<T> value) error,
    required TResult Function(DetailNotFoundState<T> value) notFound,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailInitialState<T> value)? initial,
    TResult? Function(DetailLoadingState<T> value)? loading,
    TResult? Function(DetailSuccessState<T> value)? success,
    TResult? Function(DetailErrorState<T> value)? error,
    TResult? Function(DetailNotFoundState<T> value)? notFound,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailInitialState<T> value)? initial,
    TResult Function(DetailLoadingState<T> value)? loading,
    TResult Function(DetailSuccessState<T> value)? success,
    TResult Function(DetailErrorState<T> value)? error,
    TResult Function(DetailNotFoundState<T> value)? notFound,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DetailLoadingState<T> implements DetailState<T> {
  const factory DetailLoadingState() = _$DetailLoadingStateImpl<T>;
}

/// @nodoc
abstract class _$$DetailSuccessStateImplCopyWith<T, $Res> {
  factory _$$DetailSuccessStateImplCopyWith(
    _$DetailSuccessStateImpl<T> value,
    $Res Function(_$DetailSuccessStateImpl<T>) then,
  ) = __$$DetailSuccessStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DetailSuccessStateImplCopyWithImpl<T, $Res>
    extends _$DetailStateCopyWithImpl<T, $Res, _$DetailSuccessStateImpl<T>>
    implements _$$DetailSuccessStateImplCopyWith<T, $Res> {
  __$$DetailSuccessStateImplCopyWithImpl(
    _$DetailSuccessStateImpl<T> _value,
    $Res Function(_$DetailSuccessStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$DetailSuccessStateImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T,
      ),
    );
  }
}

/// @nodoc

class _$DetailSuccessStateImpl<T> implements DetailSuccessState<T> {
  const _$DetailSuccessStateImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DetailState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailSuccessStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailSuccessStateImplCopyWith<T, _$DetailSuccessStateImpl<T>>
  get copyWith =>
      __$$DetailSuccessStateImplCopyWithImpl<T, _$DetailSuccessStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() notFound,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? notFound,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailInitialState<T> value) initial,
    required TResult Function(DetailLoadingState<T> value) loading,
    required TResult Function(DetailSuccessState<T> value) success,
    required TResult Function(DetailErrorState<T> value) error,
    required TResult Function(DetailNotFoundState<T> value) notFound,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailInitialState<T> value)? initial,
    TResult? Function(DetailLoadingState<T> value)? loading,
    TResult? Function(DetailSuccessState<T> value)? success,
    TResult? Function(DetailErrorState<T> value)? error,
    TResult? Function(DetailNotFoundState<T> value)? notFound,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailInitialState<T> value)? initial,
    TResult Function(DetailLoadingState<T> value)? loading,
    TResult Function(DetailSuccessState<T> value)? success,
    TResult Function(DetailErrorState<T> value)? error,
    TResult Function(DetailNotFoundState<T> value)? notFound,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class DetailSuccessState<T> implements DetailState<T> {
  const factory DetailSuccessState(final T data) = _$DetailSuccessStateImpl<T>;

  T get data;

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailSuccessStateImplCopyWith<T, _$DetailSuccessStateImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailErrorStateImplCopyWith<T, $Res> {
  factory _$$DetailErrorStateImplCopyWith(
    _$DetailErrorStateImpl<T> value,
    $Res Function(_$DetailErrorStateImpl<T>) then,
  ) = __$$DetailErrorStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, Object? error});
}

/// @nodoc
class __$$DetailErrorStateImplCopyWithImpl<T, $Res>
    extends _$DetailStateCopyWithImpl<T, $Res, _$DetailErrorStateImpl<T>>
    implements _$$DetailErrorStateImplCopyWith<T, $Res> {
  __$$DetailErrorStateImplCopyWithImpl(
    _$DetailErrorStateImpl<T> _value,
    $Res Function(_$DetailErrorStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? error = freezed}) {
    return _then(
      _$DetailErrorStateImpl<T>(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        freezed == error ? _value.error : error,
      ),
    );
  }
}

/// @nodoc

class _$DetailErrorStateImpl<T> implements DetailErrorState<T> {
  const _$DetailErrorStateImpl(this.message, [this.error]);

  @override
  final String message;
  @override
  final Object? error;

  @override
  String toString() {
    return 'DetailState<$T>.error(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailErrorStateImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(error),
  );

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailErrorStateImplCopyWith<T, _$DetailErrorStateImpl<T>> get copyWith =>
      __$$DetailErrorStateImplCopyWithImpl<T, _$DetailErrorStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() notFound,
  }) {
    return error(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? notFound,
  }) {
    return error?.call(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailInitialState<T> value) initial,
    required TResult Function(DetailLoadingState<T> value) loading,
    required TResult Function(DetailSuccessState<T> value) success,
    required TResult Function(DetailErrorState<T> value) error,
    required TResult Function(DetailNotFoundState<T> value) notFound,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailInitialState<T> value)? initial,
    TResult? Function(DetailLoadingState<T> value)? loading,
    TResult? Function(DetailSuccessState<T> value)? success,
    TResult? Function(DetailErrorState<T> value)? error,
    TResult? Function(DetailNotFoundState<T> value)? notFound,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailInitialState<T> value)? initial,
    TResult Function(DetailLoadingState<T> value)? loading,
    TResult Function(DetailSuccessState<T> value)? success,
    TResult Function(DetailErrorState<T> value)? error,
    TResult Function(DetailNotFoundState<T> value)? notFound,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DetailErrorState<T> implements DetailState<T> {
  const factory DetailErrorState(final String message, [final Object? error]) =
      _$DetailErrorStateImpl<T>;

  String get message;
  Object? get error;

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailErrorStateImplCopyWith<T, _$DetailErrorStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailNotFoundStateImplCopyWith<T, $Res> {
  factory _$$DetailNotFoundStateImplCopyWith(
    _$DetailNotFoundStateImpl<T> value,
    $Res Function(_$DetailNotFoundStateImpl<T>) then,
  ) = __$$DetailNotFoundStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$DetailNotFoundStateImplCopyWithImpl<T, $Res>
    extends _$DetailStateCopyWithImpl<T, $Res, _$DetailNotFoundStateImpl<T>>
    implements _$$DetailNotFoundStateImplCopyWith<T, $Res> {
  __$$DetailNotFoundStateImplCopyWithImpl(
    _$DetailNotFoundStateImpl<T> _value,
    $Res Function(_$DetailNotFoundStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetailNotFoundStateImpl<T> implements DetailNotFoundState<T> {
  const _$DetailNotFoundStateImpl();

  @override
  String toString() {
    return 'DetailState<$T>.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailNotFoundStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() notFound,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? notFound,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailInitialState<T> value) initial,
    required TResult Function(DetailLoadingState<T> value) loading,
    required TResult Function(DetailSuccessState<T> value) success,
    required TResult Function(DetailErrorState<T> value) error,
    required TResult Function(DetailNotFoundState<T> value) notFound,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailInitialState<T> value)? initial,
    TResult? Function(DetailLoadingState<T> value)? loading,
    TResult? Function(DetailSuccessState<T> value)? success,
    TResult? Function(DetailErrorState<T> value)? error,
    TResult? Function(DetailNotFoundState<T> value)? notFound,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailInitialState<T> value)? initial,
    TResult Function(DetailLoadingState<T> value)? loading,
    TResult Function(DetailSuccessState<T> value)? success,
    TResult Function(DetailErrorState<T> value)? error,
    TResult Function(DetailNotFoundState<T> value)? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class DetailNotFoundState<T> implements DetailState<T> {
  const factory DetailNotFoundState() = _$DetailNotFoundStateImpl<T>;
}

/// @nodoc
mixin _$SearchState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searching,
    required TResult Function(List<T> results) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searching,
    TResult? Function(List<T> results)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searching,
    TResult Function(List<T> results)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchInitialState<T> value) initial,
    required TResult Function(SearchSearchingState<T> value) searching,
    required TResult Function(SearchSuccessState<T> value) success,
    required TResult Function(SearchErrorState<T> value) error,
    required TResult Function(SearchEmptyState<T> value) empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchInitialState<T> value)? initial,
    TResult? Function(SearchSearchingState<T> value)? searching,
    TResult? Function(SearchSuccessState<T> value)? success,
    TResult? Function(SearchErrorState<T> value)? error,
    TResult? Function(SearchEmptyState<T> value)? empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchInitialState<T> value)? initial,
    TResult Function(SearchSearchingState<T> value)? searching,
    TResult Function(SearchSuccessState<T> value)? success,
    TResult Function(SearchErrorState<T> value)? error,
    TResult Function(SearchEmptyState<T> value)? empty,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<T, $Res> {
  factory $SearchStateCopyWith(
    SearchState<T> value,
    $Res Function(SearchState<T>) then,
  ) = _$SearchStateCopyWithImpl<T, $Res, SearchState<T>>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<T, $Res, $Val extends SearchState<T>>
    implements $SearchStateCopyWith<T, $Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SearchInitialStateImplCopyWith<T, $Res> {
  factory _$$SearchInitialStateImplCopyWith(
    _$SearchInitialStateImpl<T> value,
    $Res Function(_$SearchInitialStateImpl<T>) then,
  ) = __$$SearchInitialStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SearchInitialStateImplCopyWithImpl<T, $Res>
    extends _$SearchStateCopyWithImpl<T, $Res, _$SearchInitialStateImpl<T>>
    implements _$$SearchInitialStateImplCopyWith<T, $Res> {
  __$$SearchInitialStateImplCopyWithImpl(
    _$SearchInitialStateImpl<T> _value,
    $Res Function(_$SearchInitialStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchInitialStateImpl<T> implements SearchInitialState<T> {
  const _$SearchInitialStateImpl();

  @override
  String toString() {
    return 'SearchState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchInitialStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searching,
    required TResult Function(List<T> results) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() empty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searching,
    TResult? Function(List<T> results)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? empty,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searching,
    TResult Function(List<T> results)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchInitialState<T> value) initial,
    required TResult Function(SearchSearchingState<T> value) searching,
    required TResult Function(SearchSuccessState<T> value) success,
    required TResult Function(SearchErrorState<T> value) error,
    required TResult Function(SearchEmptyState<T> value) empty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchInitialState<T> value)? initial,
    TResult? Function(SearchSearchingState<T> value)? searching,
    TResult? Function(SearchSuccessState<T> value)? success,
    TResult? Function(SearchErrorState<T> value)? error,
    TResult? Function(SearchEmptyState<T> value)? empty,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchInitialState<T> value)? initial,
    TResult Function(SearchSearchingState<T> value)? searching,
    TResult Function(SearchSuccessState<T> value)? success,
    TResult Function(SearchErrorState<T> value)? error,
    TResult Function(SearchEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SearchInitialState<T> implements SearchState<T> {
  const factory SearchInitialState() = _$SearchInitialStateImpl<T>;
}

/// @nodoc
abstract class _$$SearchSearchingStateImplCopyWith<T, $Res> {
  factory _$$SearchSearchingStateImplCopyWith(
    _$SearchSearchingStateImpl<T> value,
    $Res Function(_$SearchSearchingStateImpl<T>) then,
  ) = __$$SearchSearchingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SearchSearchingStateImplCopyWithImpl<T, $Res>
    extends _$SearchStateCopyWithImpl<T, $Res, _$SearchSearchingStateImpl<T>>
    implements _$$SearchSearchingStateImplCopyWith<T, $Res> {
  __$$SearchSearchingStateImplCopyWithImpl(
    _$SearchSearchingStateImpl<T> _value,
    $Res Function(_$SearchSearchingStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchSearchingStateImpl<T> implements SearchSearchingState<T> {
  const _$SearchSearchingStateImpl();

  @override
  String toString() {
    return 'SearchState<$T>.searching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSearchingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searching,
    required TResult Function(List<T> results) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() empty,
  }) {
    return searching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searching,
    TResult? Function(List<T> results)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? empty,
  }) {
    return searching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searching,
    TResult Function(List<T> results)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchInitialState<T> value) initial,
    required TResult Function(SearchSearchingState<T> value) searching,
    required TResult Function(SearchSuccessState<T> value) success,
    required TResult Function(SearchErrorState<T> value) error,
    required TResult Function(SearchEmptyState<T> value) empty,
  }) {
    return searching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchInitialState<T> value)? initial,
    TResult? Function(SearchSearchingState<T> value)? searching,
    TResult? Function(SearchSuccessState<T> value)? success,
    TResult? Function(SearchErrorState<T> value)? error,
    TResult? Function(SearchEmptyState<T> value)? empty,
  }) {
    return searching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchInitialState<T> value)? initial,
    TResult Function(SearchSearchingState<T> value)? searching,
    TResult Function(SearchSuccessState<T> value)? success,
    TResult Function(SearchErrorState<T> value)? error,
    TResult Function(SearchEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(this);
    }
    return orElse();
  }
}

abstract class SearchSearchingState<T> implements SearchState<T> {
  const factory SearchSearchingState() = _$SearchSearchingStateImpl<T>;
}

/// @nodoc
abstract class _$$SearchSuccessStateImplCopyWith<T, $Res> {
  factory _$$SearchSuccessStateImplCopyWith(
    _$SearchSuccessStateImpl<T> value,
    $Res Function(_$SearchSuccessStateImpl<T>) then,
  ) = __$$SearchSuccessStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> results});
}

/// @nodoc
class __$$SearchSuccessStateImplCopyWithImpl<T, $Res>
    extends _$SearchStateCopyWithImpl<T, $Res, _$SearchSuccessStateImpl<T>>
    implements _$$SearchSuccessStateImplCopyWith<T, $Res> {
  __$$SearchSuccessStateImplCopyWithImpl(
    _$SearchSuccessStateImpl<T> _value,
    $Res Function(_$SearchSuccessStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? results = null}) {
    return _then(
      _$SearchSuccessStateImpl<T>(
        null == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc

class _$SearchSuccessStateImpl<T> implements SearchSuccessState<T> {
  const _$SearchSuccessStateImpl(final List<T> results) : _results = results;

  final List<T> _results;
  @override
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'SearchState<$T>.success(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuccessStateImpl<T> &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuccessStateImplCopyWith<T, _$SearchSuccessStateImpl<T>>
  get copyWith =>
      __$$SearchSuccessStateImplCopyWithImpl<T, _$SearchSuccessStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searching,
    required TResult Function(List<T> results) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() empty,
  }) {
    return success(results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searching,
    TResult? Function(List<T> results)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? empty,
  }) {
    return success?.call(results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searching,
    TResult Function(List<T> results)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchInitialState<T> value) initial,
    required TResult Function(SearchSearchingState<T> value) searching,
    required TResult Function(SearchSuccessState<T> value) success,
    required TResult Function(SearchErrorState<T> value) error,
    required TResult Function(SearchEmptyState<T> value) empty,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchInitialState<T> value)? initial,
    TResult? Function(SearchSearchingState<T> value)? searching,
    TResult? Function(SearchSuccessState<T> value)? success,
    TResult? Function(SearchErrorState<T> value)? error,
    TResult? Function(SearchEmptyState<T> value)? empty,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchInitialState<T> value)? initial,
    TResult Function(SearchSearchingState<T> value)? searching,
    TResult Function(SearchSuccessState<T> value)? success,
    TResult Function(SearchErrorState<T> value)? error,
    TResult Function(SearchEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SearchSuccessState<T> implements SearchState<T> {
  const factory SearchSuccessState(final List<T> results) =
      _$SearchSuccessStateImpl<T>;

  List<T> get results;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchSuccessStateImplCopyWith<T, _$SearchSuccessStateImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchErrorStateImplCopyWith<T, $Res> {
  factory _$$SearchErrorStateImplCopyWith(
    _$SearchErrorStateImpl<T> value,
    $Res Function(_$SearchErrorStateImpl<T>) then,
  ) = __$$SearchErrorStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, Object? error});
}

/// @nodoc
class __$$SearchErrorStateImplCopyWithImpl<T, $Res>
    extends _$SearchStateCopyWithImpl<T, $Res, _$SearchErrorStateImpl<T>>
    implements _$$SearchErrorStateImplCopyWith<T, $Res> {
  __$$SearchErrorStateImplCopyWithImpl(
    _$SearchErrorStateImpl<T> _value,
    $Res Function(_$SearchErrorStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? error = freezed}) {
    return _then(
      _$SearchErrorStateImpl<T>(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        freezed == error ? _value.error : error,
      ),
    );
  }
}

/// @nodoc

class _$SearchErrorStateImpl<T> implements SearchErrorState<T> {
  const _$SearchErrorStateImpl(this.message, [this.error]);

  @override
  final String message;
  @override
  final Object? error;

  @override
  String toString() {
    return 'SearchState<$T>.error(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchErrorStateImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(error),
  );

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchErrorStateImplCopyWith<T, _$SearchErrorStateImpl<T>> get copyWith =>
      __$$SearchErrorStateImplCopyWithImpl<T, _$SearchErrorStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searching,
    required TResult Function(List<T> results) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() empty,
  }) {
    return error(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searching,
    TResult? Function(List<T> results)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? empty,
  }) {
    return error?.call(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searching,
    TResult Function(List<T> results)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchInitialState<T> value) initial,
    required TResult Function(SearchSearchingState<T> value) searching,
    required TResult Function(SearchSuccessState<T> value) success,
    required TResult Function(SearchErrorState<T> value) error,
    required TResult Function(SearchEmptyState<T> value) empty,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchInitialState<T> value)? initial,
    TResult? Function(SearchSearchingState<T> value)? searching,
    TResult? Function(SearchSuccessState<T> value)? success,
    TResult? Function(SearchErrorState<T> value)? error,
    TResult? Function(SearchEmptyState<T> value)? empty,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchInitialState<T> value)? initial,
    TResult Function(SearchSearchingState<T> value)? searching,
    TResult Function(SearchSuccessState<T> value)? success,
    TResult Function(SearchErrorState<T> value)? error,
    TResult Function(SearchEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SearchErrorState<T> implements SearchState<T> {
  const factory SearchErrorState(final String message, [final Object? error]) =
      _$SearchErrorStateImpl<T>;

  String get message;
  Object? get error;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchErrorStateImplCopyWith<T, _$SearchErrorStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEmptyStateImplCopyWith<T, $Res> {
  factory _$$SearchEmptyStateImplCopyWith(
    _$SearchEmptyStateImpl<T> value,
    $Res Function(_$SearchEmptyStateImpl<T>) then,
  ) = __$$SearchEmptyStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SearchEmptyStateImplCopyWithImpl<T, $Res>
    extends _$SearchStateCopyWithImpl<T, $Res, _$SearchEmptyStateImpl<T>>
    implements _$$SearchEmptyStateImplCopyWith<T, $Res> {
  __$$SearchEmptyStateImplCopyWithImpl(
    _$SearchEmptyStateImpl<T> _value,
    $Res Function(_$SearchEmptyStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchEmptyStateImpl<T> implements SearchEmptyState<T> {
  const _$SearchEmptyStateImpl();

  @override
  String toString() {
    return 'SearchState<$T>.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEmptyStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searching,
    required TResult Function(List<T> results) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searching,
    TResult? Function(List<T> results)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searching,
    TResult Function(List<T> results)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchInitialState<T> value) initial,
    required TResult Function(SearchSearchingState<T> value) searching,
    required TResult Function(SearchSuccessState<T> value) success,
    required TResult Function(SearchErrorState<T> value) error,
    required TResult Function(SearchEmptyState<T> value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchInitialState<T> value)? initial,
    TResult? Function(SearchSearchingState<T> value)? searching,
    TResult? Function(SearchSuccessState<T> value)? success,
    TResult? Function(SearchErrorState<T> value)? error,
    TResult? Function(SearchEmptyState<T> value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchInitialState<T> value)? initial,
    TResult Function(SearchSearchingState<T> value)? searching,
    TResult Function(SearchSuccessState<T> value)? success,
    TResult Function(SearchErrorState<T> value)? error,
    TResult Function(SearchEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class SearchEmptyState<T> implements SearchState<T> {
  const factory SearchEmptyState() = _$SearchEmptyStateImpl<T>;
}

/// @nodoc
mixin _$CrudState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function() updating,
    required TResult Function(T data) updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function()? updating,
    TResult? Function(T data)? updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function()? updating,
    TResult Function(T data)? updated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudInitialState<T> value) initial,
    required TResult Function(CrudLoadingState<T> value) loading,
    required TResult Function(CrudSuccessState<T> value) success,
    required TResult Function(CrudErrorState<T> value) error,
    required TResult Function(CrudDeletingState<T> value) deleting,
    required TResult Function(CrudDeletedState<T> value) deleted,
    required TResult Function(CrudUpdatingState<T> value) updating,
    required TResult Function(CrudUpdatedState<T> value) updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudInitialState<T> value)? initial,
    TResult? Function(CrudLoadingState<T> value)? loading,
    TResult? Function(CrudSuccessState<T> value)? success,
    TResult? Function(CrudErrorState<T> value)? error,
    TResult? Function(CrudDeletingState<T> value)? deleting,
    TResult? Function(CrudDeletedState<T> value)? deleted,
    TResult? Function(CrudUpdatingState<T> value)? updating,
    TResult? Function(CrudUpdatedState<T> value)? updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudInitialState<T> value)? initial,
    TResult Function(CrudLoadingState<T> value)? loading,
    TResult Function(CrudSuccessState<T> value)? success,
    TResult Function(CrudErrorState<T> value)? error,
    TResult Function(CrudDeletingState<T> value)? deleting,
    TResult Function(CrudDeletedState<T> value)? deleted,
    TResult Function(CrudUpdatingState<T> value)? updating,
    TResult Function(CrudUpdatedState<T> value)? updated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrudStateCopyWith<T, $Res> {
  factory $CrudStateCopyWith(
    CrudState<T> value,
    $Res Function(CrudState<T>) then,
  ) = _$CrudStateCopyWithImpl<T, $Res, CrudState<T>>;
}

/// @nodoc
class _$CrudStateCopyWithImpl<T, $Res, $Val extends CrudState<T>>
    implements $CrudStateCopyWith<T, $Res> {
  _$CrudStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CrudInitialStateImplCopyWith<T, $Res> {
  factory _$$CrudInitialStateImplCopyWith(
    _$CrudInitialStateImpl<T> value,
    $Res Function(_$CrudInitialStateImpl<T>) then,
  ) = __$$CrudInitialStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CrudInitialStateImplCopyWithImpl<T, $Res>
    extends _$CrudStateCopyWithImpl<T, $Res, _$CrudInitialStateImpl<T>>
    implements _$$CrudInitialStateImplCopyWith<T, $Res> {
  __$$CrudInitialStateImplCopyWithImpl(
    _$CrudInitialStateImpl<T> _value,
    $Res Function(_$CrudInitialStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CrudInitialStateImpl<T> implements CrudInitialState<T> {
  const _$CrudInitialStateImpl();

  @override
  String toString() {
    return 'CrudState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudInitialStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function() updating,
    required TResult Function(T data) updated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function()? updating,
    TResult? Function(T data)? updated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function()? updating,
    TResult Function(T data)? updated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudInitialState<T> value) initial,
    required TResult Function(CrudLoadingState<T> value) loading,
    required TResult Function(CrudSuccessState<T> value) success,
    required TResult Function(CrudErrorState<T> value) error,
    required TResult Function(CrudDeletingState<T> value) deleting,
    required TResult Function(CrudDeletedState<T> value) deleted,
    required TResult Function(CrudUpdatingState<T> value) updating,
    required TResult Function(CrudUpdatedState<T> value) updated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudInitialState<T> value)? initial,
    TResult? Function(CrudLoadingState<T> value)? loading,
    TResult? Function(CrudSuccessState<T> value)? success,
    TResult? Function(CrudErrorState<T> value)? error,
    TResult? Function(CrudDeletingState<T> value)? deleting,
    TResult? Function(CrudDeletedState<T> value)? deleted,
    TResult? Function(CrudUpdatingState<T> value)? updating,
    TResult? Function(CrudUpdatedState<T> value)? updated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudInitialState<T> value)? initial,
    TResult Function(CrudLoadingState<T> value)? loading,
    TResult Function(CrudSuccessState<T> value)? success,
    TResult Function(CrudErrorState<T> value)? error,
    TResult Function(CrudDeletingState<T> value)? deleting,
    TResult Function(CrudDeletedState<T> value)? deleted,
    TResult Function(CrudUpdatingState<T> value)? updating,
    TResult Function(CrudUpdatedState<T> value)? updated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CrudInitialState<T> implements CrudState<T> {
  const factory CrudInitialState() = _$CrudInitialStateImpl<T>;
}

/// @nodoc
abstract class _$$CrudLoadingStateImplCopyWith<T, $Res> {
  factory _$$CrudLoadingStateImplCopyWith(
    _$CrudLoadingStateImpl<T> value,
    $Res Function(_$CrudLoadingStateImpl<T>) then,
  ) = __$$CrudLoadingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CrudLoadingStateImplCopyWithImpl<T, $Res>
    extends _$CrudStateCopyWithImpl<T, $Res, _$CrudLoadingStateImpl<T>>
    implements _$$CrudLoadingStateImplCopyWith<T, $Res> {
  __$$CrudLoadingStateImplCopyWithImpl(
    _$CrudLoadingStateImpl<T> _value,
    $Res Function(_$CrudLoadingStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CrudLoadingStateImpl<T> implements CrudLoadingState<T> {
  const _$CrudLoadingStateImpl();

  @override
  String toString() {
    return 'CrudState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudLoadingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function() updating,
    required TResult Function(T data) updated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function()? updating,
    TResult? Function(T data)? updated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function()? updating,
    TResult Function(T data)? updated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudInitialState<T> value) initial,
    required TResult Function(CrudLoadingState<T> value) loading,
    required TResult Function(CrudSuccessState<T> value) success,
    required TResult Function(CrudErrorState<T> value) error,
    required TResult Function(CrudDeletingState<T> value) deleting,
    required TResult Function(CrudDeletedState<T> value) deleted,
    required TResult Function(CrudUpdatingState<T> value) updating,
    required TResult Function(CrudUpdatedState<T> value) updated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudInitialState<T> value)? initial,
    TResult? Function(CrudLoadingState<T> value)? loading,
    TResult? Function(CrudSuccessState<T> value)? success,
    TResult? Function(CrudErrorState<T> value)? error,
    TResult? Function(CrudDeletingState<T> value)? deleting,
    TResult? Function(CrudDeletedState<T> value)? deleted,
    TResult? Function(CrudUpdatingState<T> value)? updating,
    TResult? Function(CrudUpdatedState<T> value)? updated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudInitialState<T> value)? initial,
    TResult Function(CrudLoadingState<T> value)? loading,
    TResult Function(CrudSuccessState<T> value)? success,
    TResult Function(CrudErrorState<T> value)? error,
    TResult Function(CrudDeletingState<T> value)? deleting,
    TResult Function(CrudDeletedState<T> value)? deleted,
    TResult Function(CrudUpdatingState<T> value)? updating,
    TResult Function(CrudUpdatedState<T> value)? updated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CrudLoadingState<T> implements CrudState<T> {
  const factory CrudLoadingState() = _$CrudLoadingStateImpl<T>;
}

/// @nodoc
abstract class _$$CrudSuccessStateImplCopyWith<T, $Res> {
  factory _$$CrudSuccessStateImplCopyWith(
    _$CrudSuccessStateImpl<T> value,
    $Res Function(_$CrudSuccessStateImpl<T>) then,
  ) = __$$CrudSuccessStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$CrudSuccessStateImplCopyWithImpl<T, $Res>
    extends _$CrudStateCopyWithImpl<T, $Res, _$CrudSuccessStateImpl<T>>
    implements _$$CrudSuccessStateImplCopyWith<T, $Res> {
  __$$CrudSuccessStateImplCopyWithImpl(
    _$CrudSuccessStateImpl<T> _value,
    $Res Function(_$CrudSuccessStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$CrudSuccessStateImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T,
      ),
    );
  }
}

/// @nodoc

class _$CrudSuccessStateImpl<T> implements CrudSuccessState<T> {
  const _$CrudSuccessStateImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'CrudState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudSuccessStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrudSuccessStateImplCopyWith<T, _$CrudSuccessStateImpl<T>> get copyWith =>
      __$$CrudSuccessStateImplCopyWithImpl<T, _$CrudSuccessStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function() updating,
    required TResult Function(T data) updated,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function()? updating,
    TResult? Function(T data)? updated,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function()? updating,
    TResult Function(T data)? updated,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudInitialState<T> value) initial,
    required TResult Function(CrudLoadingState<T> value) loading,
    required TResult Function(CrudSuccessState<T> value) success,
    required TResult Function(CrudErrorState<T> value) error,
    required TResult Function(CrudDeletingState<T> value) deleting,
    required TResult Function(CrudDeletedState<T> value) deleted,
    required TResult Function(CrudUpdatingState<T> value) updating,
    required TResult Function(CrudUpdatedState<T> value) updated,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudInitialState<T> value)? initial,
    TResult? Function(CrudLoadingState<T> value)? loading,
    TResult? Function(CrudSuccessState<T> value)? success,
    TResult? Function(CrudErrorState<T> value)? error,
    TResult? Function(CrudDeletingState<T> value)? deleting,
    TResult? Function(CrudDeletedState<T> value)? deleted,
    TResult? Function(CrudUpdatingState<T> value)? updating,
    TResult? Function(CrudUpdatedState<T> value)? updated,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudInitialState<T> value)? initial,
    TResult Function(CrudLoadingState<T> value)? loading,
    TResult Function(CrudSuccessState<T> value)? success,
    TResult Function(CrudErrorState<T> value)? error,
    TResult Function(CrudDeletingState<T> value)? deleting,
    TResult Function(CrudDeletedState<T> value)? deleted,
    TResult Function(CrudUpdatingState<T> value)? updating,
    TResult Function(CrudUpdatedState<T> value)? updated,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CrudSuccessState<T> implements CrudState<T> {
  const factory CrudSuccessState(final T data) = _$CrudSuccessStateImpl<T>;

  T get data;

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrudSuccessStateImplCopyWith<T, _$CrudSuccessStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CrudErrorStateImplCopyWith<T, $Res> {
  factory _$$CrudErrorStateImplCopyWith(
    _$CrudErrorStateImpl<T> value,
    $Res Function(_$CrudErrorStateImpl<T>) then,
  ) = __$$CrudErrorStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, Object? error});
}

/// @nodoc
class __$$CrudErrorStateImplCopyWithImpl<T, $Res>
    extends _$CrudStateCopyWithImpl<T, $Res, _$CrudErrorStateImpl<T>>
    implements _$$CrudErrorStateImplCopyWith<T, $Res> {
  __$$CrudErrorStateImplCopyWithImpl(
    _$CrudErrorStateImpl<T> _value,
    $Res Function(_$CrudErrorStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? error = freezed}) {
    return _then(
      _$CrudErrorStateImpl<T>(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        freezed == error ? _value.error : error,
      ),
    );
  }
}

/// @nodoc

class _$CrudErrorStateImpl<T> implements CrudErrorState<T> {
  const _$CrudErrorStateImpl(this.message, [this.error]);

  @override
  final String message;
  @override
  final Object? error;

  @override
  String toString() {
    return 'CrudState<$T>.error(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudErrorStateImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(error),
  );

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrudErrorStateImplCopyWith<T, _$CrudErrorStateImpl<T>> get copyWith =>
      __$$CrudErrorStateImplCopyWithImpl<T, _$CrudErrorStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function() updating,
    required TResult Function(T data) updated,
  }) {
    return error(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function()? updating,
    TResult? Function(T data)? updated,
  }) {
    return error?.call(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function()? updating,
    TResult Function(T data)? updated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudInitialState<T> value) initial,
    required TResult Function(CrudLoadingState<T> value) loading,
    required TResult Function(CrudSuccessState<T> value) success,
    required TResult Function(CrudErrorState<T> value) error,
    required TResult Function(CrudDeletingState<T> value) deleting,
    required TResult Function(CrudDeletedState<T> value) deleted,
    required TResult Function(CrudUpdatingState<T> value) updating,
    required TResult Function(CrudUpdatedState<T> value) updated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudInitialState<T> value)? initial,
    TResult? Function(CrudLoadingState<T> value)? loading,
    TResult? Function(CrudSuccessState<T> value)? success,
    TResult? Function(CrudErrorState<T> value)? error,
    TResult? Function(CrudDeletingState<T> value)? deleting,
    TResult? Function(CrudDeletedState<T> value)? deleted,
    TResult? Function(CrudUpdatingState<T> value)? updating,
    TResult? Function(CrudUpdatedState<T> value)? updated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudInitialState<T> value)? initial,
    TResult Function(CrudLoadingState<T> value)? loading,
    TResult Function(CrudSuccessState<T> value)? success,
    TResult Function(CrudErrorState<T> value)? error,
    TResult Function(CrudDeletingState<T> value)? deleting,
    TResult Function(CrudDeletedState<T> value)? deleted,
    TResult Function(CrudUpdatingState<T> value)? updating,
    TResult Function(CrudUpdatedState<T> value)? updated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CrudErrorState<T> implements CrudState<T> {
  const factory CrudErrorState(final String message, [final Object? error]) =
      _$CrudErrorStateImpl<T>;

  String get message;
  Object? get error;

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrudErrorStateImplCopyWith<T, _$CrudErrorStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CrudDeletingStateImplCopyWith<T, $Res> {
  factory _$$CrudDeletingStateImplCopyWith(
    _$CrudDeletingStateImpl<T> value,
    $Res Function(_$CrudDeletingStateImpl<T>) then,
  ) = __$$CrudDeletingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CrudDeletingStateImplCopyWithImpl<T, $Res>
    extends _$CrudStateCopyWithImpl<T, $Res, _$CrudDeletingStateImpl<T>>
    implements _$$CrudDeletingStateImplCopyWith<T, $Res> {
  __$$CrudDeletingStateImplCopyWithImpl(
    _$CrudDeletingStateImpl<T> _value,
    $Res Function(_$CrudDeletingStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CrudDeletingStateImpl<T> implements CrudDeletingState<T> {
  const _$CrudDeletingStateImpl();

  @override
  String toString() {
    return 'CrudState<$T>.deleting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudDeletingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function() updating,
    required TResult Function(T data) updated,
  }) {
    return deleting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function()? updating,
    TResult? Function(T data)? updated,
  }) {
    return deleting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function()? updating,
    TResult Function(T data)? updated,
    required TResult orElse(),
  }) {
    if (deleting != null) {
      return deleting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudInitialState<T> value) initial,
    required TResult Function(CrudLoadingState<T> value) loading,
    required TResult Function(CrudSuccessState<T> value) success,
    required TResult Function(CrudErrorState<T> value) error,
    required TResult Function(CrudDeletingState<T> value) deleting,
    required TResult Function(CrudDeletedState<T> value) deleted,
    required TResult Function(CrudUpdatingState<T> value) updating,
    required TResult Function(CrudUpdatedState<T> value) updated,
  }) {
    return deleting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudInitialState<T> value)? initial,
    TResult? Function(CrudLoadingState<T> value)? loading,
    TResult? Function(CrudSuccessState<T> value)? success,
    TResult? Function(CrudErrorState<T> value)? error,
    TResult? Function(CrudDeletingState<T> value)? deleting,
    TResult? Function(CrudDeletedState<T> value)? deleted,
    TResult? Function(CrudUpdatingState<T> value)? updating,
    TResult? Function(CrudUpdatedState<T> value)? updated,
  }) {
    return deleting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudInitialState<T> value)? initial,
    TResult Function(CrudLoadingState<T> value)? loading,
    TResult Function(CrudSuccessState<T> value)? success,
    TResult Function(CrudErrorState<T> value)? error,
    TResult Function(CrudDeletingState<T> value)? deleting,
    TResult Function(CrudDeletedState<T> value)? deleted,
    TResult Function(CrudUpdatingState<T> value)? updating,
    TResult Function(CrudUpdatedState<T> value)? updated,
    required TResult orElse(),
  }) {
    if (deleting != null) {
      return deleting(this);
    }
    return orElse();
  }
}

abstract class CrudDeletingState<T> implements CrudState<T> {
  const factory CrudDeletingState() = _$CrudDeletingStateImpl<T>;
}

/// @nodoc
abstract class _$$CrudDeletedStateImplCopyWith<T, $Res> {
  factory _$$CrudDeletedStateImplCopyWith(
    _$CrudDeletedStateImpl<T> value,
    $Res Function(_$CrudDeletedStateImpl<T>) then,
  ) = __$$CrudDeletedStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CrudDeletedStateImplCopyWithImpl<T, $Res>
    extends _$CrudStateCopyWithImpl<T, $Res, _$CrudDeletedStateImpl<T>>
    implements _$$CrudDeletedStateImplCopyWith<T, $Res> {
  __$$CrudDeletedStateImplCopyWithImpl(
    _$CrudDeletedStateImpl<T> _value,
    $Res Function(_$CrudDeletedStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CrudDeletedStateImpl<T> implements CrudDeletedState<T> {
  const _$CrudDeletedStateImpl();

  @override
  String toString() {
    return 'CrudState<$T>.deleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudDeletedStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function() updating,
    required TResult Function(T data) updated,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function()? updating,
    TResult? Function(T data)? updated,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function()? updating,
    TResult Function(T data)? updated,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudInitialState<T> value) initial,
    required TResult Function(CrudLoadingState<T> value) loading,
    required TResult Function(CrudSuccessState<T> value) success,
    required TResult Function(CrudErrorState<T> value) error,
    required TResult Function(CrudDeletingState<T> value) deleting,
    required TResult Function(CrudDeletedState<T> value) deleted,
    required TResult Function(CrudUpdatingState<T> value) updating,
    required TResult Function(CrudUpdatedState<T> value) updated,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudInitialState<T> value)? initial,
    TResult? Function(CrudLoadingState<T> value)? loading,
    TResult? Function(CrudSuccessState<T> value)? success,
    TResult? Function(CrudErrorState<T> value)? error,
    TResult? Function(CrudDeletingState<T> value)? deleting,
    TResult? Function(CrudDeletedState<T> value)? deleted,
    TResult? Function(CrudUpdatingState<T> value)? updating,
    TResult? Function(CrudUpdatedState<T> value)? updated,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudInitialState<T> value)? initial,
    TResult Function(CrudLoadingState<T> value)? loading,
    TResult Function(CrudSuccessState<T> value)? success,
    TResult Function(CrudErrorState<T> value)? error,
    TResult Function(CrudDeletingState<T> value)? deleting,
    TResult Function(CrudDeletedState<T> value)? deleted,
    TResult Function(CrudUpdatingState<T> value)? updating,
    TResult Function(CrudUpdatedState<T> value)? updated,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class CrudDeletedState<T> implements CrudState<T> {
  const factory CrudDeletedState() = _$CrudDeletedStateImpl<T>;
}

/// @nodoc
abstract class _$$CrudUpdatingStateImplCopyWith<T, $Res> {
  factory _$$CrudUpdatingStateImplCopyWith(
    _$CrudUpdatingStateImpl<T> value,
    $Res Function(_$CrudUpdatingStateImpl<T>) then,
  ) = __$$CrudUpdatingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CrudUpdatingStateImplCopyWithImpl<T, $Res>
    extends _$CrudStateCopyWithImpl<T, $Res, _$CrudUpdatingStateImpl<T>>
    implements _$$CrudUpdatingStateImplCopyWith<T, $Res> {
  __$$CrudUpdatingStateImplCopyWithImpl(
    _$CrudUpdatingStateImpl<T> _value,
    $Res Function(_$CrudUpdatingStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CrudUpdatingStateImpl<T> implements CrudUpdatingState<T> {
  const _$CrudUpdatingStateImpl();

  @override
  String toString() {
    return 'CrudState<$T>.updating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudUpdatingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function() updating,
    required TResult Function(T data) updated,
  }) {
    return updating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function()? updating,
    TResult? Function(T data)? updated,
  }) {
    return updating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function()? updating,
    TResult Function(T data)? updated,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudInitialState<T> value) initial,
    required TResult Function(CrudLoadingState<T> value) loading,
    required TResult Function(CrudSuccessState<T> value) success,
    required TResult Function(CrudErrorState<T> value) error,
    required TResult Function(CrudDeletingState<T> value) deleting,
    required TResult Function(CrudDeletedState<T> value) deleted,
    required TResult Function(CrudUpdatingState<T> value) updating,
    required TResult Function(CrudUpdatedState<T> value) updated,
  }) {
    return updating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudInitialState<T> value)? initial,
    TResult? Function(CrudLoadingState<T> value)? loading,
    TResult? Function(CrudSuccessState<T> value)? success,
    TResult? Function(CrudErrorState<T> value)? error,
    TResult? Function(CrudDeletingState<T> value)? deleting,
    TResult? Function(CrudDeletedState<T> value)? deleted,
    TResult? Function(CrudUpdatingState<T> value)? updating,
    TResult? Function(CrudUpdatedState<T> value)? updated,
  }) {
    return updating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudInitialState<T> value)? initial,
    TResult Function(CrudLoadingState<T> value)? loading,
    TResult Function(CrudSuccessState<T> value)? success,
    TResult Function(CrudErrorState<T> value)? error,
    TResult Function(CrudDeletingState<T> value)? deleting,
    TResult Function(CrudDeletedState<T> value)? deleted,
    TResult Function(CrudUpdatingState<T> value)? updating,
    TResult Function(CrudUpdatedState<T> value)? updated,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(this);
    }
    return orElse();
  }
}

abstract class CrudUpdatingState<T> implements CrudState<T> {
  const factory CrudUpdatingState() = _$CrudUpdatingStateImpl<T>;
}

/// @nodoc
abstract class _$$CrudUpdatedStateImplCopyWith<T, $Res> {
  factory _$$CrudUpdatedStateImplCopyWith(
    _$CrudUpdatedStateImpl<T> value,
    $Res Function(_$CrudUpdatedStateImpl<T>) then,
  ) = __$$CrudUpdatedStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$CrudUpdatedStateImplCopyWithImpl<T, $Res>
    extends _$CrudStateCopyWithImpl<T, $Res, _$CrudUpdatedStateImpl<T>>
    implements _$$CrudUpdatedStateImplCopyWith<T, $Res> {
  __$$CrudUpdatedStateImplCopyWithImpl(
    _$CrudUpdatedStateImpl<T> _value,
    $Res Function(_$CrudUpdatedStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$CrudUpdatedStateImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T,
      ),
    );
  }
}

/// @nodoc

class _$CrudUpdatedStateImpl<T> implements CrudUpdatedState<T> {
  const _$CrudUpdatedStateImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'CrudState<$T>.updated(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrudUpdatedStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrudUpdatedStateImplCopyWith<T, _$CrudUpdatedStateImpl<T>> get copyWith =>
      __$$CrudUpdatedStateImplCopyWithImpl<T, _$CrudUpdatedStateImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function() deleting,
    required TResult Function() deleted,
    required TResult Function() updating,
    required TResult Function(T data) updated,
  }) {
    return updated(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function()? deleting,
    TResult? Function()? deleted,
    TResult? Function()? updating,
    TResult? Function(T data)? updated,
  }) {
    return updated?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function()? deleting,
    TResult Function()? deleted,
    TResult Function()? updating,
    TResult Function(T data)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudInitialState<T> value) initial,
    required TResult Function(CrudLoadingState<T> value) loading,
    required TResult Function(CrudSuccessState<T> value) success,
    required TResult Function(CrudErrorState<T> value) error,
    required TResult Function(CrudDeletingState<T> value) deleting,
    required TResult Function(CrudDeletedState<T> value) deleted,
    required TResult Function(CrudUpdatingState<T> value) updating,
    required TResult Function(CrudUpdatedState<T> value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CrudInitialState<T> value)? initial,
    TResult? Function(CrudLoadingState<T> value)? loading,
    TResult? Function(CrudSuccessState<T> value)? success,
    TResult? Function(CrudErrorState<T> value)? error,
    TResult? Function(CrudDeletingState<T> value)? deleting,
    TResult? Function(CrudDeletedState<T> value)? deleted,
    TResult? Function(CrudUpdatingState<T> value)? updating,
    TResult? Function(CrudUpdatedState<T> value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudInitialState<T> value)? initial,
    TResult Function(CrudLoadingState<T> value)? loading,
    TResult Function(CrudSuccessState<T> value)? success,
    TResult Function(CrudErrorState<T> value)? error,
    TResult Function(CrudDeletingState<T> value)? deleting,
    TResult Function(CrudDeletedState<T> value)? deleted,
    TResult Function(CrudUpdatingState<T> value)? updating,
    TResult Function(CrudUpdatedState<T> value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class CrudUpdatedState<T> implements CrudState<T> {
  const factory CrudUpdatedState(final T data) = _$CrudUpdatedStateImpl<T>;

  T get data;

  /// Create a copy of CrudState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrudUpdatedStateImplCopyWith<T, _$CrudUpdatedStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
