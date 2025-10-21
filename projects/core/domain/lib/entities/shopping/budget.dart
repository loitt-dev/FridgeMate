import 'package:freezed_annotation/freezed_annotation.dart';
import '../common/money.dart';

part 'budget.freezed.dart';
part 'budget.g.dart';

@freezed
class Budget with _$Budget {
  const factory Budget({
    required String id,
    required Money totalAmount,
    required Money spentAmount,
    required DateTime startDate,
    required DateTime endDate,
    String? userId,
    Map<String, Money>? categoryBudgets,
  }) = _Budget;

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);
}
