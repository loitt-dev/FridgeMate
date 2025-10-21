import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class CommonFailure with _$CommonFailure {
  const factory CommonFailure.network(String message) = NetworkFailure;
  const factory CommonFailure.unknown(String message) = UnknownFailure;
  const factory CommonFailure.validation(String message) = ValidationFailure;
  const factory CommonFailure.notFound(String message) = NotFoundFailure;
  const factory CommonFailure.unauthorized(String message) =
      UnauthorizedFailure;
}
