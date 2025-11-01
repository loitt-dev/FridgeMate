// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fridge_home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FridgeHomeState {
  // Loading states
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRefreshing => throw _privateConstructorUsedError; // Error state
  String? get errorMessage =>
      throw _privateConstructorUsedError; // Fridge statistics
  int get fridgeItemCount => throw _privateConstructorUsedError;
  StorageStats? get fridgeStats =>
      throw _privateConstructorUsedError; // Expiring items
  int get todayExpiryCount => throw _privateConstructorUsedError;
  int get threeDaysExpiryCount => throw _privateConstructorUsedError;
  int get weekExpiryCount => throw _privateConstructorUsedError;
  List<StorageItem> get expiringItems =>
      throw _privateConstructorUsedError; // Recipe suggestions
  List<Recipe> get suggestedRecipes => throw _privateConstructorUsedError;
  bool get isLoadingRecipes =>
      throw _privateConstructorUsedError; // Shopping list
  int get shoppingItemCount => throw _privateConstructorUsedError;
  List<String> get shoppingPreviewItems =>
      throw _privateConstructorUsedError; // UI state
  int get selectedBottomNavIndex => throw _privateConstructorUsedError;

  /// Create a copy of FridgeHomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FridgeHomeStateCopyWith<FridgeHomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridgeHomeStateCopyWith<$Res> {
  factory $FridgeHomeStateCopyWith(
    FridgeHomeState value,
    $Res Function(FridgeHomeState) then,
  ) = _$FridgeHomeStateCopyWithImpl<$Res, FridgeHomeState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isRefreshing,
    String? errorMessage,
    int fridgeItemCount,
    StorageStats? fridgeStats,
    int todayExpiryCount,
    int threeDaysExpiryCount,
    int weekExpiryCount,
    List<StorageItem> expiringItems,
    List<Recipe> suggestedRecipes,
    bool isLoadingRecipes,
    int shoppingItemCount,
    List<String> shoppingPreviewItems,
    int selectedBottomNavIndex,
  });

  $StorageStatsCopyWith<$Res>? get fridgeStats;
}

/// @nodoc
class _$FridgeHomeStateCopyWithImpl<$Res, $Val extends FridgeHomeState>
    implements $FridgeHomeStateCopyWith<$Res> {
  _$FridgeHomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FridgeHomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefreshing = null,
    Object? errorMessage = freezed,
    Object? fridgeItemCount = null,
    Object? fridgeStats = freezed,
    Object? todayExpiryCount = null,
    Object? threeDaysExpiryCount = null,
    Object? weekExpiryCount = null,
    Object? expiringItems = null,
    Object? suggestedRecipes = null,
    Object? isLoadingRecipes = null,
    Object? shoppingItemCount = null,
    Object? shoppingPreviewItems = null,
    Object? selectedBottomNavIndex = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRefreshing: null == isRefreshing
                ? _value.isRefreshing
                : isRefreshing // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            fridgeItemCount: null == fridgeItemCount
                ? _value.fridgeItemCount
                : fridgeItemCount // ignore: cast_nullable_to_non_nullable
                      as int,
            fridgeStats: freezed == fridgeStats
                ? _value.fridgeStats
                : fridgeStats // ignore: cast_nullable_to_non_nullable
                      as StorageStats?,
            todayExpiryCount: null == todayExpiryCount
                ? _value.todayExpiryCount
                : todayExpiryCount // ignore: cast_nullable_to_non_nullable
                      as int,
            threeDaysExpiryCount: null == threeDaysExpiryCount
                ? _value.threeDaysExpiryCount
                : threeDaysExpiryCount // ignore: cast_nullable_to_non_nullable
                      as int,
            weekExpiryCount: null == weekExpiryCount
                ? _value.weekExpiryCount
                : weekExpiryCount // ignore: cast_nullable_to_non_nullable
                      as int,
            expiringItems: null == expiringItems
                ? _value.expiringItems
                : expiringItems // ignore: cast_nullable_to_non_nullable
                      as List<StorageItem>,
            suggestedRecipes: null == suggestedRecipes
                ? _value.suggestedRecipes
                : suggestedRecipes // ignore: cast_nullable_to_non_nullable
                      as List<Recipe>,
            isLoadingRecipes: null == isLoadingRecipes
                ? _value.isLoadingRecipes
                : isLoadingRecipes // ignore: cast_nullable_to_non_nullable
                      as bool,
            shoppingItemCount: null == shoppingItemCount
                ? _value.shoppingItemCount
                : shoppingItemCount // ignore: cast_nullable_to_non_nullable
                      as int,
            shoppingPreviewItems: null == shoppingPreviewItems
                ? _value.shoppingPreviewItems
                : shoppingPreviewItems // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            selectedBottomNavIndex: null == selectedBottomNavIndex
                ? _value.selectedBottomNavIndex
                : selectedBottomNavIndex // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of FridgeHomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StorageStatsCopyWith<$Res>? get fridgeStats {
    if (_value.fridgeStats == null) {
      return null;
    }

    return $StorageStatsCopyWith<$Res>(_value.fridgeStats!, (value) {
      return _then(_value.copyWith(fridgeStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FridgeHomeStateImplCopyWith<$Res>
    implements $FridgeHomeStateCopyWith<$Res> {
  factory _$$FridgeHomeStateImplCopyWith(
    _$FridgeHomeStateImpl value,
    $Res Function(_$FridgeHomeStateImpl) then,
  ) = __$$FridgeHomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isRefreshing,
    String? errorMessage,
    int fridgeItemCount,
    StorageStats? fridgeStats,
    int todayExpiryCount,
    int threeDaysExpiryCount,
    int weekExpiryCount,
    List<StorageItem> expiringItems,
    List<Recipe> suggestedRecipes,
    bool isLoadingRecipes,
    int shoppingItemCount,
    List<String> shoppingPreviewItems,
    int selectedBottomNavIndex,
  });

  @override
  $StorageStatsCopyWith<$Res>? get fridgeStats;
}

/// @nodoc
class __$$FridgeHomeStateImplCopyWithImpl<$Res>
    extends _$FridgeHomeStateCopyWithImpl<$Res, _$FridgeHomeStateImpl>
    implements _$$FridgeHomeStateImplCopyWith<$Res> {
  __$$FridgeHomeStateImplCopyWithImpl(
    _$FridgeHomeStateImpl _value,
    $Res Function(_$FridgeHomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FridgeHomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefreshing = null,
    Object? errorMessage = freezed,
    Object? fridgeItemCount = null,
    Object? fridgeStats = freezed,
    Object? todayExpiryCount = null,
    Object? threeDaysExpiryCount = null,
    Object? weekExpiryCount = null,
    Object? expiringItems = null,
    Object? suggestedRecipes = null,
    Object? isLoadingRecipes = null,
    Object? shoppingItemCount = null,
    Object? shoppingPreviewItems = null,
    Object? selectedBottomNavIndex = null,
  }) {
    return _then(
      _$FridgeHomeStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRefreshing: null == isRefreshing
            ? _value.isRefreshing
            : isRefreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        fridgeItemCount: null == fridgeItemCount
            ? _value.fridgeItemCount
            : fridgeItemCount // ignore: cast_nullable_to_non_nullable
                  as int,
        fridgeStats: freezed == fridgeStats
            ? _value.fridgeStats
            : fridgeStats // ignore: cast_nullable_to_non_nullable
                  as StorageStats?,
        todayExpiryCount: null == todayExpiryCount
            ? _value.todayExpiryCount
            : todayExpiryCount // ignore: cast_nullable_to_non_nullable
                  as int,
        threeDaysExpiryCount: null == threeDaysExpiryCount
            ? _value.threeDaysExpiryCount
            : threeDaysExpiryCount // ignore: cast_nullable_to_non_nullable
                  as int,
        weekExpiryCount: null == weekExpiryCount
            ? _value.weekExpiryCount
            : weekExpiryCount // ignore: cast_nullable_to_non_nullable
                  as int,
        expiringItems: null == expiringItems
            ? _value._expiringItems
            : expiringItems // ignore: cast_nullable_to_non_nullable
                  as List<StorageItem>,
        suggestedRecipes: null == suggestedRecipes
            ? _value._suggestedRecipes
            : suggestedRecipes // ignore: cast_nullable_to_non_nullable
                  as List<Recipe>,
        isLoadingRecipes: null == isLoadingRecipes
            ? _value.isLoadingRecipes
            : isLoadingRecipes // ignore: cast_nullable_to_non_nullable
                  as bool,
        shoppingItemCount: null == shoppingItemCount
            ? _value.shoppingItemCount
            : shoppingItemCount // ignore: cast_nullable_to_non_nullable
                  as int,
        shoppingPreviewItems: null == shoppingPreviewItems
            ? _value._shoppingPreviewItems
            : shoppingPreviewItems // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        selectedBottomNavIndex: null == selectedBottomNavIndex
            ? _value.selectedBottomNavIndex
            : selectedBottomNavIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$FridgeHomeStateImpl implements _FridgeHomeState {
  const _$FridgeHomeStateImpl({
    this.isLoading = false,
    this.isRefreshing = false,
    this.errorMessage,
    this.fridgeItemCount = 0,
    this.fridgeStats,
    this.todayExpiryCount = 0,
    this.threeDaysExpiryCount = 0,
    this.weekExpiryCount = 0,
    final List<StorageItem> expiringItems = const [],
    final List<Recipe> suggestedRecipes = const [],
    this.isLoadingRecipes = false,
    this.shoppingItemCount = 0,
    final List<String> shoppingPreviewItems = const [],
    this.selectedBottomNavIndex = 2,
  }) : _expiringItems = expiringItems,
       _suggestedRecipes = suggestedRecipes,
       _shoppingPreviewItems = shoppingPreviewItems;

  // Loading states
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isRefreshing;
  // Error state
  @override
  final String? errorMessage;
  // Fridge statistics
  @override
  @JsonKey()
  final int fridgeItemCount;
  @override
  final StorageStats? fridgeStats;
  // Expiring items
  @override
  @JsonKey()
  final int todayExpiryCount;
  @override
  @JsonKey()
  final int threeDaysExpiryCount;
  @override
  @JsonKey()
  final int weekExpiryCount;
  final List<StorageItem> _expiringItems;
  @override
  @JsonKey()
  List<StorageItem> get expiringItems {
    if (_expiringItems is EqualUnmodifiableListView) return _expiringItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expiringItems);
  }

  // Recipe suggestions
  final List<Recipe> _suggestedRecipes;
  // Recipe suggestions
  @override
  @JsonKey()
  List<Recipe> get suggestedRecipes {
    if (_suggestedRecipes is EqualUnmodifiableListView)
      return _suggestedRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedRecipes);
  }

  @override
  @JsonKey()
  final bool isLoadingRecipes;
  // Shopping list
  @override
  @JsonKey()
  final int shoppingItemCount;
  final List<String> _shoppingPreviewItems;
  @override
  @JsonKey()
  List<String> get shoppingPreviewItems {
    if (_shoppingPreviewItems is EqualUnmodifiableListView)
      return _shoppingPreviewItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingPreviewItems);
  }

  // UI state
  @override
  @JsonKey()
  final int selectedBottomNavIndex;

  @override
  String toString() {
    return 'FridgeHomeState(isLoading: $isLoading, isRefreshing: $isRefreshing, errorMessage: $errorMessage, fridgeItemCount: $fridgeItemCount, fridgeStats: $fridgeStats, todayExpiryCount: $todayExpiryCount, threeDaysExpiryCount: $threeDaysExpiryCount, weekExpiryCount: $weekExpiryCount, expiringItems: $expiringItems, suggestedRecipes: $suggestedRecipes, isLoadingRecipes: $isLoadingRecipes, shoppingItemCount: $shoppingItemCount, shoppingPreviewItems: $shoppingPreviewItems, selectedBottomNavIndex: $selectedBottomNavIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FridgeHomeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.fridgeItemCount, fridgeItemCount) ||
                other.fridgeItemCount == fridgeItemCount) &&
            (identical(other.fridgeStats, fridgeStats) ||
                other.fridgeStats == fridgeStats) &&
            (identical(other.todayExpiryCount, todayExpiryCount) ||
                other.todayExpiryCount == todayExpiryCount) &&
            (identical(other.threeDaysExpiryCount, threeDaysExpiryCount) ||
                other.threeDaysExpiryCount == threeDaysExpiryCount) &&
            (identical(other.weekExpiryCount, weekExpiryCount) ||
                other.weekExpiryCount == weekExpiryCount) &&
            const DeepCollectionEquality().equals(
              other._expiringItems,
              _expiringItems,
            ) &&
            const DeepCollectionEquality().equals(
              other._suggestedRecipes,
              _suggestedRecipes,
            ) &&
            (identical(other.isLoadingRecipes, isLoadingRecipes) ||
                other.isLoadingRecipes == isLoadingRecipes) &&
            (identical(other.shoppingItemCount, shoppingItemCount) ||
                other.shoppingItemCount == shoppingItemCount) &&
            const DeepCollectionEquality().equals(
              other._shoppingPreviewItems,
              _shoppingPreviewItems,
            ) &&
            (identical(other.selectedBottomNavIndex, selectedBottomNavIndex) ||
                other.selectedBottomNavIndex == selectedBottomNavIndex));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isRefreshing,
    errorMessage,
    fridgeItemCount,
    fridgeStats,
    todayExpiryCount,
    threeDaysExpiryCount,
    weekExpiryCount,
    const DeepCollectionEquality().hash(_expiringItems),
    const DeepCollectionEquality().hash(_suggestedRecipes),
    isLoadingRecipes,
    shoppingItemCount,
    const DeepCollectionEquality().hash(_shoppingPreviewItems),
    selectedBottomNavIndex,
  );

  /// Create a copy of FridgeHomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FridgeHomeStateImplCopyWith<_$FridgeHomeStateImpl> get copyWith =>
      __$$FridgeHomeStateImplCopyWithImpl<_$FridgeHomeStateImpl>(
        this,
        _$identity,
      );
}

abstract class _FridgeHomeState implements FridgeHomeState {
  const factory _FridgeHomeState({
    final bool isLoading,
    final bool isRefreshing,
    final String? errorMessage,
    final int fridgeItemCount,
    final StorageStats? fridgeStats,
    final int todayExpiryCount,
    final int threeDaysExpiryCount,
    final int weekExpiryCount,
    final List<StorageItem> expiringItems,
    final List<Recipe> suggestedRecipes,
    final bool isLoadingRecipes,
    final int shoppingItemCount,
    final List<String> shoppingPreviewItems,
    final int selectedBottomNavIndex,
  }) = _$FridgeHomeStateImpl;

  // Loading states
  @override
  bool get isLoading;
  @override
  bool get isRefreshing; // Error state
  @override
  String? get errorMessage; // Fridge statistics
  @override
  int get fridgeItemCount;
  @override
  StorageStats? get fridgeStats; // Expiring items
  @override
  int get todayExpiryCount;
  @override
  int get threeDaysExpiryCount;
  @override
  int get weekExpiryCount;
  @override
  List<StorageItem> get expiringItems; // Recipe suggestions
  @override
  List<Recipe> get suggestedRecipes;
  @override
  bool get isLoadingRecipes; // Shopping list
  @override
  int get shoppingItemCount;
  @override
  List<String> get shoppingPreviewItems; // UI state
  @override
  int get selectedBottomNavIndex;

  /// Create a copy of FridgeHomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FridgeHomeStateImplCopyWith<_$FridgeHomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
