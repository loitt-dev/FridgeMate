// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooking_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CookingStepImpl _$$CookingStepImplFromJson(Map<String, dynamic> json) =>
    _$CookingStepImpl(
      stepNumber: (json['stepNumber'] as num).toInt(),
      instruction: json['instruction'] as String,
      duration: (json['duration'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      tips: (json['tips'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CookingStepImplToJson(_$CookingStepImpl instance) =>
    <String, dynamic>{
      'stepNumber': instance.stepNumber,
      'instruction': instance.instruction,
      'duration': instance.duration,
      'imageUrl': instance.imageUrl,
      'tips': instance.tips,
    };
