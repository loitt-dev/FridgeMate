import 'package:freezed_annotation/freezed_annotation.dart';

part 'cooking_step.freezed.dart';
part 'cooking_step.g.dart';

@freezed
class CookingStep with _$CookingStep {
  const factory CookingStep({
    required int stepNumber,
    required String instruction,
    int? duration, // in minutes
    String? imageUrl,
    List<String>? tips,
  }) = _CookingStep;

  factory CookingStep.fromJson(Map<String, dynamic> json) =>
      _$CookingStepFromJson(json);
}
