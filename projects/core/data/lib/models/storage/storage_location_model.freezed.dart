// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StorageLocationModel _$StorageLocationModelFromJson(Map<String, dynamic> json) {
  return _StorageLocationModel.fromJson(json);
}

/// @nodoc
mixin _$StorageLocationModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  int? get currentItems => throw _privateConstructorUsedError;

  /// Serializes this StorageLocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StorageLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StorageLocationModelCopyWith<StorageLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageLocationModelCopyWith<$Res> {
  factory $StorageLocationModelCopyWith(
    StorageLocationModel value,
    $Res Function(StorageLocationModel) then,
  ) = _$StorageLocationModelCopyWithImpl<$Res, StorageLocationModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String type,
    String? description,
    int? capacity,
    int? currentItems,
  });
}

/// @nodoc
class _$StorageLocationModelCopyWithImpl<
  $Res,
  $Val extends StorageLocationModel
>
    implements $StorageLocationModelCopyWith<$Res> {
  _$StorageLocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StorageLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? description = freezed,
    Object? capacity = freezed,
    Object? currentItems = freezed,
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
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            capacity: freezed == capacity
                ? _value.capacity
                : capacity // ignore: cast_nullable_to_non_nullable
                      as int?,
            currentItems: freezed == currentItems
                ? _value.currentItems
                : currentItems // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StorageLocationModelImplCopyWith<$Res>
    implements $StorageLocationModelCopyWith<$Res> {
  factory _$$StorageLocationModelImplCopyWith(
    _$StorageLocationModelImpl value,
    $Res Function(_$StorageLocationModelImpl) then,
  ) = __$$StorageLocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String type,
    String? description,
    int? capacity,
    int? currentItems,
  });
}

/// @nodoc
class __$$StorageLocationModelImplCopyWithImpl<$Res>
    extends _$StorageLocationModelCopyWithImpl<$Res, _$StorageLocationModelImpl>
    implements _$$StorageLocationModelImplCopyWith<$Res> {
  __$$StorageLocationModelImplCopyWithImpl(
    _$StorageLocationModelImpl _value,
    $Res Function(_$StorageLocationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StorageLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? description = freezed,
    Object? capacity = freezed,
    Object? currentItems = freezed,
  }) {
    return _then(
      _$StorageLocationModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        capacity: freezed == capacity
            ? _value.capacity
            : capacity // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentItems: freezed == currentItems
            ? _value.currentItems
            : currentItems // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageLocationModelImpl extends _StorageLocationModel {
  const _$StorageLocationModelImpl({
    required this.id,
    required this.name,
    required this.type,
    this.description,
    this.capacity,
    this.currentItems,
  }) : super._();

  factory _$StorageLocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageLocationModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String? description;
  @override
  final int? capacity;
  @override
  final int? currentItems;

  @override
  String toString() {
    return 'StorageLocationModel(id: $id, name: $name, type: $type, description: $description, capacity: $capacity, currentItems: $currentItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageLocationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.currentItems, currentItems) ||
                other.currentItems == currentItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    description,
    capacity,
    currentItems,
  );

  /// Create a copy of StorageLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageLocationModelImplCopyWith<_$StorageLocationModelImpl>
  get copyWith =>
      __$$StorageLocationModelImplCopyWithImpl<_$StorageLocationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageLocationModelImplToJson(this);
  }
}

abstract class _StorageLocationModel extends StorageLocationModel {
  const factory _StorageLocationModel({
    required final String id,
    required final String name,
    required final String type,
    final String? description,
    final int? capacity,
    final int? currentItems,
  }) = _$StorageLocationModelImpl;
  const _StorageLocationModel._() : super._();

  factory _StorageLocationModel.fromJson(Map<String, dynamic> json) =
      _$StorageLocationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String? get description;
  @override
  int? get capacity;
  @override
  int? get currentItems;

  /// Create a copy of StorageLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorageLocationModelImplCopyWith<_$StorageLocationModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
