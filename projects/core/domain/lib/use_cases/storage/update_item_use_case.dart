import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../entities/storage/storage.dart';
import '../../repositories/storage_repository.dart';
import '../base_use_case.dart';

class UpdateItemUseCase implements UseCase<StorageItem, StorageItem> {
  final StorageRepository _repository;

  UpdateItemUseCase(this._repository);

  @override
  Future<Either<CommonFailure, StorageItem>> call(StorageItem params) async {
    return await _repository.updateItem(params);
  }
}
