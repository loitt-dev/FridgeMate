import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'reminder_state.dart';

/// ViewModel for Reminder Screen
class ReminderViewModel extends StateNotifier<ReminderState> {
  ReminderViewModel() : super(ReminderState.initial());

  /// Initialize screen
  Future<void> initialize() async {
    // TODO: Implement initialization logic
  }
}
