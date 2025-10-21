// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecipeTag _$RecipeTagFromJson(Map<String, dynamic> json) {
  return _RecipeTag.fromJson(json);
}

/// @nodoc
mixin _$RecipeTag {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this RecipeTag to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeTagCopyWith<RecipeTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeTagCopyWith<$Res> {
  factory $RecipeTagCopyWith(RecipeTag value, $Res Function(RecipeTag) then) =
      _$RecipeTagCopyWithImpl<$Res, RecipeTag>;
  @useResult
  $Res call({String id, String name, String color, String? description});
}

/// @nodoc
class _$RecipeTagCopyWithImpl<$Res, $Val extends RecipeTag>
    implements $RecipeTagCopyWith<$Res> {
  _$RecipeTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? description = freezed,
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
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecipeTagImplCopyWith<$Res>
    implements $RecipeTagCopyWith<$Res> {
  factory _$$RecipeTagImplCopyWith(
    _$RecipeTagImpl value,
    $Res Function(_$RecipeTagImpl) then,
  ) = __$$RecipeTagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String color, String? description});
}

/// @nodoc
class __$$RecipeTagImplCopyWithImpl<$Res>
    extends _$RecipeTagCopyWithImpl<$Res, _$RecipeTagImpl>
    implements _$$RecipeTagImplCopyWith<$Res> {
  __$$RecipeTagImplCopyWithImpl(
    _$RecipeTagImpl _value,
    $Res Function(_$RecipeTagImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecipeTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? description = freezed,
  }) {
    return _then(
      _$RecipeTagImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeTagImpl implements _RecipeTag {
  const _$RecipeTagImpl({
    required this.id,
    required this.name,
    required this.color,
    this.description,
  });

  factory _$RecipeTagImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeTagImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String color;
  @override
  final String? description;

  @override
  String toString() {
    return 'RecipeTag(id: $id, name: $name, color: $color, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeTagImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color, description);

  /// Create a copy of RecipeTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeTagImplCopyWith<_$RecipeTagImpl> get copyWith =>
      __$$RecipeTagImplCopyWithImpl<_$RecipeTagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeTagImplToJson(this);
  }
}

abstract class _RecipeTag implements RecipeTag {
  const factory _RecipeTag({
    required final String id,
    required final String name,
    required final String color,
    final String? description,
  }) = _$RecipeTagImpl;

  factory _RecipeTag.fromJson(Map<String, dynamic> json) =
      _$RecipeTagImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get color;
  @override
  String? get description;

  /// Create a copy of RecipeTag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeTagImplCopyWith<_$RecipeTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
