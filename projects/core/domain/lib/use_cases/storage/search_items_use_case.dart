import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../entities/storage/storage.dart';
import '../../repositories/storage_repository.dart';
import '../base_use_case.dart';

class SearchItemsUseCase implements UseCase<List<StorageItem>, String> {
  final StorageRepository _repository;

  SearchItemsUseCase(this._repository);

  @override
  Future<Either<CommonFailure, List<StorageItem>>> call(String params) async {
    return await _repository.searchItems(params);
  }
}
