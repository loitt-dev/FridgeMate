// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ReminderState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ReminderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderStateCopyWith<ReminderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderStateCopyWith<$Res> {
  factory $ReminderStateCopyWith(
    ReminderState value,
    $Res Function(ReminderState) then,
  ) = _$ReminderStateCopyWithImpl<$Res, ReminderState>;
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class _$ReminderStateCopyWithImpl<$Res, $Val extends ReminderState>
    implements $ReminderStateCopyWith<$Res> {
  _$ReminderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoading = null, Object? errorMessage = freezed}) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReminderStateImplCopyWith<$Res>
    implements $ReminderStateCopyWith<$Res> {
  factory _$$ReminderStateImplCopyWith(
    _$ReminderStateImpl value,
    $Res Function(_$ReminderStateImpl) then,
  ) = __$$ReminderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$ReminderStateImplCopyWithImpl<$Res>
    extends _$ReminderStateCopyWithImpl<$Res, _$ReminderStateImpl>
    implements _$$ReminderStateImplCopyWith<$Res> {
  __$$ReminderStateImplCopyWithImpl(
    _$ReminderStateImpl _value,
    $Res Function(_$ReminderStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReminderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoading = null, Object? errorMessage = freezed}) {
    return _then(
      _$ReminderStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ReminderStateImpl implements _ReminderState {
  const _$ReminderStateImpl({this.isLoading = false, this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ReminderState(isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage);

  /// Create a copy of ReminderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderStateImplCopyWith<_$ReminderStateImpl> get copyWith =>
      __$$ReminderStateImplCopyWithImpl<_$ReminderStateImpl>(this, _$identity);
}

abstract class _ReminderState implements ReminderState {
  const factory _ReminderState({
    final bool isLoading,
    final String? errorMessage,
  }) = _$ReminderStateImpl;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of ReminderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderStateImplCopyWith<_$ReminderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
