import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'medicine_list_state.dart';

/// ViewModel for Medicine List Screen
class MedicineListViewModel extends StateNotifier<MedicineListState> {
  MedicineListViewModel() : super(MedicineListState.initial());

  /// Initialize screen
  Future<void> initialize() async {
    // TODO: Implement initialization logic
  }
}
