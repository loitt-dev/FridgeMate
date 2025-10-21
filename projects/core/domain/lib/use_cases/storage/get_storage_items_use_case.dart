import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../entities/storage/storage.dart';
import '../../repositories/storage_repository.dart';
import '../base_use_case.dart';

class GetStorageItemsUseCase
    implements UseCase<List<StorageItem>, GetStorageItemsParams> {
  final StorageRepository _repository;

  GetStorageItemsUseCase(this._repository);

  @override
  Future<Either<CommonFailure, List<StorageItem>>> call(
    GetStorageItemsParams params,
  ) async {
    return await _repository.getItems(
      categoryId: params.categoryId,
      onlyExpiring: params.onlyExpiring,
    );
  }
}

class GetStorageItemsParams {
  final String? categoryId;
  final bool onlyExpiring;

  const GetStorageItemsParams({this.categoryId, this.onlyExpiring = false});
}
