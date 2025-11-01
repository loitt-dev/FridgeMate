import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine_list_state.freezed.dart';

/// State for Medicine List Screen
@freezed
class MedicineListState with _$MedicineListState {
  const factory MedicineListState({
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _MedicineListState;

  factory MedicineListState.initial() => const MedicineListState();
}
