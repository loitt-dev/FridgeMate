// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetImpl _$$BudgetImplFromJson(Map<String, dynamic> json) => _$BudgetImpl(
  id: json['id'] as String,
  totalAmount: Money.fromJson(json['totalAmount'] as Map<String, dynamic>),
  spentAmount: Money.fromJson(json['spentAmount'] as Map<String, dynamic>),
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  userId: json['userId'] as String?,
  categoryBudgets: (json['categoryBudgets'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, Money.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$$BudgetImplToJson(_$BudgetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalAmount': instance.totalAmount,
      'spentAmount': instance.spentAmount,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'userId': instance.userId,
      'categoryBudgets': instance.categoryBudgets,
    };
