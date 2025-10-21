import 'package:dartz/dartz.dart';
import 'package:domain/entities/common/failure.dart';
import 'package:domain/entities/storage/storage.dart';
import 'package:domain/repositories/storage_repository.dart';
import '../data_sources/local/storage_local_data_source.dart';
import '../data_sources/remote/storage_remote_data_source.dart';

class StorageRepositoryImpl implements StorageRepository {
  final StorageLocalDataSource _localDataSource;
  final StorageRemoteDataSource _remoteDataSource;

  StorageRepositoryImpl({
    required StorageLocalDataSource localDataSource,
    required StorageRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  @override
  Future<Either<CommonFailure, List<StorageItem>>> getItems({
    String? categoryId,
    bool onlyExpiring = false,
  }) async {
    try {
      // For Phase 1, return empty list
      return const Right([]);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, StorageItem>> addItem(StorageItem item) async {
    try {
      // For Phase 1, return the item as is
      return Right(item);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, StorageItem>> updateItem(
    StorageItem item,
  ) async {
    try {
      // For Phase 1, return the item as is
      return Right(item);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, void>> deleteItem(String itemId) async {
    try {
      // For Phase 1, do nothing
      return const Right(null);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, List<StorageItem>>> getExpiringItems(
    int days,
  ) async {
    try {
      // For Phase 1, return empty list
      return const Right([]);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, List<StorageItem>>> searchItems(
    String query,
  ) async {
    try {
      // For Phase 1, return empty list
      return const Right([]);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, List<StorageCategory>>> getCategories() async {
    try {
      // For Phase 1, return empty list
      return const Right([]);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, StorageCategory>> addCategory(
    StorageCategory category,
  ) async {
    try {
      // For Phase 1, return the category as is
      return Right(category);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, List<StorageLocation>>> getLocations() async {
    try {
      // For Phase 1, return empty list
      return const Right([]);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, StorageLocation>> addLocation(
    StorageLocation location,
  ) async {
    try {
      // For Phase 1, return the location as is
      return Right(location);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, StorageItem>> getItemById(String itemId) async {
    try {
      // For Phase 1, throw not found
      return Left(CommonFailure.notFound('Item not found'));
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, StorageStats>> getStats() async {
    try {
      // For Phase 1, return empty stats
      return Right(
        StorageStats(
          totalItems: 0,
          expiringSoon: 0,
          expired: 0,
          categories: 0,
          itemsByCategory: {},
          itemsByLocation: {},
        ),
      );
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }
}
