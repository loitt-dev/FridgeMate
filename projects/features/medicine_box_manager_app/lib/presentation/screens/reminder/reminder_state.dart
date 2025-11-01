import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_state.freezed.dart';

/// State for Reminder Screen
@freezed
class ReminderState with _$ReminderState {
  const factory ReminderState({
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _ReminderState;

  factory ReminderState.initial() => const ReminderState();
}
