// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StorageStatsModel _$StorageStatsModelFromJson(Map<String, dynamic> json) {
  return _StorageStatsModel.fromJson(json);
}

/// @nodoc
mixin _$StorageStatsModel {
  int get totalItems => throw _privateConstructorUsedError;
  int get expiringSoon => throw _privateConstructorUsedError;
  int get expired => throw _privateConstructorUsedError;
  int get categories => throw _privateConstructorUsedError;
  Map<String, int> get itemsByCategory => throw _privateConstructorUsedError;
  Map<String, int> get itemsByLocation => throw _privateConstructorUsedError;

  /// Serializes this StorageStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StorageStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StorageStatsModelCopyWith<StorageStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageStatsModelCopyWith<$Res> {
  factory $StorageStatsModelCopyWith(
    StorageStatsModel value,
    $Res Function(StorageStatsModel) then,
  ) = _$StorageStatsModelCopyWithImpl<$Res, StorageStatsModel>;
  @useResult
  $Res call({
    int totalItems,
    int expiringSoon,
    int expired,
    int categories,
    Map<String, int> itemsByCategory,
    Map<String, int> itemsByLocation,
  });
}

/// @nodoc
class _$StorageStatsModelCopyWithImpl<$Res, $Val extends StorageStatsModel>
    implements $StorageStatsModelCopyWith<$Res> {
  _$StorageStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StorageStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? expiringSoon = null,
    Object? expired = null,
    Object? categories = null,
    Object? itemsByCategory = null,
    Object? itemsByLocation = null,
  }) {
    return _then(
      _value.copyWith(
            totalItems: null == totalItems
                ? _value.totalItems
                : totalItems // ignore: cast_nullable_to_non_nullable
                      as int,
            expiringSoon: null == expiringSoon
                ? _value.expiringSoon
                : expiringSoon // ignore: cast_nullable_to_non_nullable
                      as int,
            expired: null == expired
                ? _value.expired
                : expired // ignore: cast_nullable_to_non_nullable
                      as int,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as int,
            itemsByCategory: null == itemsByCategory
                ? _value.itemsByCategory
                : itemsByCategory // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            itemsByLocation: null == itemsByLocation
                ? _value.itemsByLocation
                : itemsByLocation // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StorageStatsModelImplCopyWith<$Res>
    implements $StorageStatsModelCopyWith<$Res> {
  factory _$$StorageStatsModelImplCopyWith(
    _$StorageStatsModelImpl value,
    $Res Function(_$StorageStatsModelImpl) then,
  ) = __$$StorageStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalItems,
    int expiringSoon,
    int expired,
    int categories,
    Map<String, int> itemsByCategory,
    Map<String, int> itemsByLocation,
  });
}

/// @nodoc
class __$$StorageStatsModelImplCopyWithImpl<$Res>
    extends _$StorageStatsModelCopyWithImpl<$Res, _$StorageStatsModelImpl>
    implements _$$StorageStatsModelImplCopyWith<$Res> {
  __$$StorageStatsModelImplCopyWithImpl(
    _$StorageStatsModelImpl _value,
    $Res Function(_$StorageStatsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StorageStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? expiringSoon = null,
    Object? expired = null,
    Object? categories = null,
    Object? itemsByCategory = null,
    Object? itemsByLocation = null,
  }) {
    return _then(
      _$StorageStatsModelImpl(
        totalItems: null == totalItems
            ? _value.totalItems
            : totalItems // ignore: cast_nullable_to_non_nullable
                  as int,
        expiringSoon: null == expiringSoon
            ? _value.expiringSoon
            : expiringSoon // ignore: cast_nullable_to_non_nullable
                  as int,
        expired: null == expired
            ? _value.expired
            : expired // ignore: cast_nullable_to_non_nullable
                  as int,
        categories: null == categories
            ? _value.categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as int,
        itemsByCategory: null == itemsByCategory
            ? _value._itemsByCategory
            : itemsByCategory // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        itemsByLocation: null == itemsByLocation
            ? _value._itemsByLocation
            : itemsByLocation // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageStatsModelImpl extends _StorageStatsModel {
  const _$StorageStatsModelImpl({
    required this.totalItems,
    required this.expiringSoon,
    required this.expired,
    required this.categories,
    required final Map<String, int> itemsByCategory,
    required final Map<String, int> itemsByLocation,
  }) : _itemsByCategory = itemsByCategory,
       _itemsByLocation = itemsByLocation,
       super._();

  factory _$StorageStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageStatsModelImplFromJson(json);

  @override
  final int totalItems;
  @override
  final int expiringSoon;
  @override
  final int expired;
  @override
  final int categories;
  final Map<String, int> _itemsByCategory;
  @override
  Map<String, int> get itemsByCategory {
    if (_itemsByCategory is EqualUnmodifiableMapView) return _itemsByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_itemsByCategory);
  }

  final Map<String, int> _itemsByLocation;
  @override
  Map<String, int> get itemsByLocation {
    if (_itemsByLocation is EqualUnmodifiableMapView) return _itemsByLocation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_itemsByLocation);
  }

  @override
  String toString() {
    return 'StorageStatsModel(totalItems: $totalItems, expiringSoon: $expiringSoon, expired: $expired, categories: $categories, itemsByCategory: $itemsByCategory, itemsByLocation: $itemsByLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageStatsModelImpl &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.expiringSoon, expiringSoon) ||
                other.expiringSoon == expiringSoon) &&
            (identical(other.expired, expired) || other.expired == expired) &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            const DeepCollectionEquality().equals(
              other._itemsByCategory,
              _itemsByCategory,
            ) &&
            const DeepCollectionEquality().equals(
              other._itemsByLocation,
              _itemsByLocation,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalItems,
    expiringSoon,
    expired,
    categories,
    const DeepCollectionEquality().hash(_itemsByCategory),
    const DeepCollectionEquality().hash(_itemsByLocation),
  );

  /// Create a copy of StorageStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageStatsModelImplCopyWith<_$StorageStatsModelImpl> get copyWith =>
      __$$StorageStatsModelImplCopyWithImpl<_$StorageStatsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageStatsModelImplToJson(this);
  }
}

abstract class _StorageStatsModel extends StorageStatsModel {
  const factory _StorageStatsModel({
    required final int totalItems,
    required final int expiringSoon,
    required final int expired,
    required final int categories,
    required final Map<String, int> itemsByCategory,
    required final Map<String, int> itemsByLocation,
  }) = _$StorageStatsModelImpl;
  const _StorageStatsModel._() : super._();

  factory _StorageStatsModel.fromJson(Map<String, dynamic> json) =
      _$StorageStatsModelImpl.fromJson;

  @override
  int get totalItems;
  @override
  int get expiringSoon;
  @override
  int get expired;
  @override
  int get categories;
  @override
  Map<String, int> get itemsByCategory;
  @override
  Map<String, int> get itemsByLocation;

  /// Create a copy of StorageStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorageStatsModelImplCopyWith<_$StorageStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
