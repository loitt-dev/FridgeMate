import 'package:dartz/dartz.dart';

typedef Result<T> = Either<Failure, T>;

class Failure {
  final String message;
  final String? code;
  
  const Failure({
    required this.message,
    this.code,
  });
  
  factory Failure.network(String message) => Failure(message: message);
  factory Failure.unknown(String message) => Failure(message: message);
  factory Failure.validation(String message) => Failure(message: message);
}