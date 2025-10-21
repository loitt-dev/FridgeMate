import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../entities/storage/storage.dart';
import '../../repositories/storage_repository.dart';
import '../base_use_case.dart';

class GetExpiringItemsUseCase implements UseCase<List<StorageItem>, int> {
  final StorageRepository _repository;

  GetExpiringItemsUseCase(this._repository);

  @override
  Future<Either<CommonFailure, List<StorageItem>>> call(int params) async {
    return await _repository.getExpiringItems(params);
  }
}
