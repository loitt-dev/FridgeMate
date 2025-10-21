import 'package:dartz/dartz.dart';
import 'package:domain/entities/common/failure.dart';
import 'package:domain/entities/shopping/shopping.dart';
import 'package:domain/repositories/shopping_repository.dart';

class ShoppingRepositoryImpl implements ShoppingRepository {
  @override
  Future<Either<CommonFailure, List<ShoppingList>>> getShoppingLists(
    String userId,
  ) async {
    try {
      return const Right([]);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, ShoppingList>> getShoppingListById(
    String id,
  ) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, ShoppingList>> createShoppingList(
    ShoppingList list,
  ) async {
    try {
      return Right(list);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, ShoppingList>> updateShoppingList(
    ShoppingList list,
  ) async {
    try {
      return Right(list);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, void>> deleteShoppingList(String id) async {
    try {
      return const Right(null);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, ShoppingItem>> addItemToList(
    String listId,
    ShoppingItem item,
  ) async {
    try {
      return Right(item);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, ShoppingItem>> updateItem(
    ShoppingItem item,
  ) async {
    try {
      return Right(item);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, void>> deleteItem(String itemId) async {
    try {
      return const Right(null);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, List<ShoppingItem>>> generateListFromRecipe(
    String recipeId,
  ) async {
    try {
      return const Right([]);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, Budget>> getBudget(String userId) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, Budget>> updateBudget(Budget budget) async {
    try {
      return Right(budget);
    } catch (e) {
      return Left(CommonFailure.unknown(e.toString()));
    }
  }
}
