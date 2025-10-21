import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../repositories/storage_repository.dart';
import '../base_use_case.dart';

class DeleteItemUseCase implements UseCase<void, String> {
  final StorageRepository _repository;

  DeleteItemUseCase(this._repository);

  @override
  Future<Either<CommonFailure, void>> call(String params) async {
    return await _repository.deleteItem(params);
  }
}
