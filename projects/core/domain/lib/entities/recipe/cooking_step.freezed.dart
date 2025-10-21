// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cooking_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CookingStep _$CookingStepFromJson(Map<String, dynamic> json) {
  return _CookingStep.fromJson(json);
}

/// @nodoc
mixin _$CookingStep {
  int get stepNumber => throw _privateConstructorUsedError;
  String get instruction => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError; // in minutes
  String? get imageUrl => throw _privateConstructorUsedError;
  List<String>? get tips => throw _privateConstructorUsedError;

  /// Serializes this CookingStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CookingStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CookingStepCopyWith<CookingStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CookingStepCopyWith<$Res> {
  factory $CookingStepCopyWith(
    CookingStep value,
    $Res Function(CookingStep) then,
  ) = _$CookingStepCopyWithImpl<$Res, CookingStep>;
  @useResult
  $Res call({
    int stepNumber,
    String instruction,
    int? duration,
    String? imageUrl,
    List<String>? tips,
  });
}

/// @nodoc
class _$CookingStepCopyWithImpl<$Res, $Val extends CookingStep>
    implements $CookingStepCopyWith<$Res> {
  _$CookingStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CookingStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepNumber = null,
    Object? instruction = null,
    Object? duration = freezed,
    Object? imageUrl = freezed,
    Object? tips = freezed,
  }) {
    return _then(
      _value.copyWith(
            stepNumber: null == stepNumber
                ? _value.stepNumber
                : stepNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            instruction: null == instruction
                ? _value.instruction
                : instruction // ignore: cast_nullable_to_non_nullable
                      as String,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            tips: freezed == tips
                ? _value.tips
                : tips // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CookingStepImplCopyWith<$Res>
    implements $CookingStepCopyWith<$Res> {
  factory _$$CookingStepImplCopyWith(
    _$CookingStepImpl value,
    $Res Function(_$CookingStepImpl) then,
  ) = __$$CookingStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int stepNumber,
    String instruction,
    int? duration,
    String? imageUrl,
    List<String>? tips,
  });
}

/// @nodoc
class __$$CookingStepImplCopyWithImpl<$Res>
    extends _$CookingStepCopyWithImpl<$Res, _$CookingStepImpl>
    implements _$$CookingStepImplCopyWith<$Res> {
  __$$CookingStepImplCopyWithImpl(
    _$CookingStepImpl _value,
    $Res Function(_$CookingStepImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CookingStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepNumber = null,
    Object? instruction = null,
    Object? duration = freezed,
    Object? imageUrl = freezed,
    Object? tips = freezed,
  }) {
    return _then(
      _$CookingStepImpl(
        stepNumber: null == stepNumber
            ? _value.stepNumber
            : stepNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        instruction: null == instruction
            ? _value.instruction
            : instruction // ignore: cast_nullable_to_non_nullable
                  as String,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        tips: freezed == tips
            ? _value._tips
            : tips // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CookingStepImpl implements _CookingStep {
  const _$CookingStepImpl({
    required this.stepNumber,
    required this.instruction,
    this.duration,
    this.imageUrl,
    final List<String>? tips,
  }) : _tips = tips;

  factory _$CookingStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$CookingStepImplFromJson(json);

  @override
  final int stepNumber;
  @override
  final String instruction;
  @override
  final int? duration;
  // in minutes
  @override
  final String? imageUrl;
  final List<String>? _tips;
  @override
  List<String>? get tips {
    final value = _tips;
    if (value == null) return null;
    if (_tips is EqualUnmodifiableListView) return _tips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CookingStep(stepNumber: $stepNumber, instruction: $instruction, duration: $duration, imageUrl: $imageUrl, tips: $tips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CookingStepImpl &&
            (identical(other.stepNumber, stepNumber) ||
                other.stepNumber == stepNumber) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._tips, _tips));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    stepNumber,
    instruction,
    duration,
    imageUrl,
    const DeepCollectionEquality().hash(_tips),
  );

  /// Create a copy of CookingStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CookingStepImplCopyWith<_$CookingStepImpl> get copyWith =>
      __$$CookingStepImplCopyWithImpl<_$CookingStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CookingStepImplToJson(this);
  }
}

abstract class _CookingStep implements CookingStep {
  const factory _CookingStep({
    required final int stepNumber,
    required final String instruction,
    final int? duration,
    final String? imageUrl,
    final List<String>? tips,
  }) = _$CookingStepImpl;

  factory _CookingStep.fromJson(Map<String, dynamic> json) =
      _$CookingStepImpl.fromJson;

  @override
  int get stepNumber;
  @override
  String get instruction;
  @override
  int? get duration; // in minutes
  @override
  String? get imageUrl;
  @override
  List<String>? get tips;

  /// Create a copy of CookingStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CookingStepImplCopyWith<_$CookingStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
