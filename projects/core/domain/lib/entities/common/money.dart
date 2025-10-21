import 'package:freezed_annotation/freezed_annotation.dart';

part 'money.freezed.dart';
part 'money.g.dart';

@freezed
class Money with _$Money {
  const factory Money({required double amount, required String currency}) =
      _Money;

  const Money._();

  Money operator +(Money other) {
    if (currency != other.currency) {
      throw ArgumentError('Cannot add different currencies');
    }
    return Money(amount: amount + other.amount, currency: currency);
  }

  Money operator -(Money other) {
    if (currency != other.currency) {
      throw ArgumentError('Cannot subtract different currencies');
    }
    return Money(amount: amount - other.amount, currency: currency);
  }

  @override
  String toString() => '${amount.toStringAsFixed(2)} $currency';

  factory Money.fromJson(Map<String, dynamic> json) => _$MoneyFromJson(json);
}
