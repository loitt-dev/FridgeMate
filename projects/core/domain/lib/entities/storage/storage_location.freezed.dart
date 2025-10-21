// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StorageLocation _$StorageLocationFromJson(Map<String, dynamic> json) {
  return _StorageLocation.fromJson(json);
}

/// @nodoc
mixin _$StorageLocation {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'shelf', 'drawer', 'door', etc.
  String? get description => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  int? get currentItems => throw _privateConstructorUsedError;

  /// Serializes this StorageLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StorageLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StorageLocationCopyWith<StorageLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageLocationCopyWith<$Res> {
  factory $StorageLocationCopyWith(
    StorageLocation value,
    $Res Function(StorageLocation) then,
  ) = _$StorageLocationCopyWithImpl<$Res, StorageLocation>;
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
class _$StorageLocationCopyWithImpl<$Res, $Val extends StorageLocation>
    implements $StorageLocationCopyWith<$Res> {
  _$StorageLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StorageLocation
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
abstract class _$$StorageLocationImplCopyWith<$Res>
    implements $StorageLocationCopyWith<$Res> {
  factory _$$StorageLocationImplCopyWith(
    _$StorageLocationImpl value,
    $Res Function(_$StorageLocationImpl) then,
  ) = __$$StorageLocationImplCopyWithImpl<$Res>;
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
class __$$StorageLocationImplCopyWithImpl<$Res>
    extends _$StorageLocationCopyWithImpl<$Res, _$StorageLocationImpl>
    implements _$$StorageLocationImplCopyWith<$Res> {
  __$$StorageLocationImplCopyWithImpl(
    _$StorageLocationImpl _value,
    $Res Function(_$StorageLocationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StorageLocation
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
      _$StorageLocationImpl(
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
class _$StorageLocationImpl implements _StorageLocation {
  const _$StorageLocationImpl({
    required this.id,
    required this.name,
    required this.type,
    this.description,
    this.capacity,
    this.currentItems,
  });

  factory _$StorageLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageLocationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  // 'shelf', 'drawer', 'door', etc.
  @override
  final String? description;
  @override
  final int? capacity;
  @override
  final int? currentItems;

  @override
  String toString() {
    return 'StorageLocation(id: $id, name: $name, type: $type, description: $description, capacity: $capacity, currentItems: $currentItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageLocationImpl &&
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

  /// Create a copy of StorageLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageLocationImplCopyWith<_$StorageLocationImpl> get copyWith =>
      __$$StorageLocationImplCopyWithImpl<_$StorageLocationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageLocationImplToJson(this);
  }
}

abstract class _StorageLocation implements StorageLocation {
  const factory _StorageLocation({
    required final String id,
    required final String name,
    required final String type,
    final String? description,
    final int? capacity,
    final int? currentItems,
  }) = _$StorageLocationImpl;

  factory _StorageLocation.fromJson(Map<String, dynamic> json) =
      _$StorageLocationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type; // 'shelf', 'drawer', 'door', etc.
  @override
  String? get description;
  @override
  int? get capacity;
  @override
  int? get currentItems;

  /// Create a copy of StorageLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorageLocationImplCopyWith<_$StorageLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
