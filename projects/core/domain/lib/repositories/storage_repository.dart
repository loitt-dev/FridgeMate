import 'package:dartz/dartz.dart';
import '../entities/common/failure.dart';
import '../entities/storage/storage.dart';

abstract class StorageRepository {
  Future<Either<CommonFailure, List<StorageItem>>> getItems({
    String? categoryId,
    bool onlyExpiring = false,
  });

  Future<Either<CommonFailure, StorageItem>> getItemById(String id);

  Future<Either<CommonFailure, StorageItem>> addItem(StorageItem item);

  Future<Either<CommonFailure, StorageItem>> updateItem(StorageItem item);

  Future<Either<CommonFailure, void>> deleteItem(String id);

  Future<Either<CommonFailure, List<StorageItem>>> getExpiringItems(int days);

  Future<Either<CommonFailure, List<StorageItem>>> searchItems(String query);

  Future<Either<CommonFailure, List<StorageCategory>>> getCategories();

  Future<Either<CommonFailure, StorageCategory>> addCategory(
    StorageCategory category,
  );

  Future<Either<CommonFailure, List<StorageLocation>>> getLocations();

  Future<Either<CommonFailure, StorageLocation>> addLocation(
    StorageLocation location,
  );

  Future<Either<CommonFailure, StorageStats>> getStats();
}
