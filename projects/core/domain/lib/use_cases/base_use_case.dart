import 'package:dartz/dartz.dart';
import '../entities/common/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<CommonFailure, Type>> call(Params params);
}

abstract class UseCaseNoParams<Type> {
  Future<Either<CommonFailure, Type>> call();
}

class NoParams {
  const NoParams();
}
