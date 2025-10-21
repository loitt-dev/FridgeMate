import 'package:dartz/dartz.dart';
import '../entities/common/failure.dart';
import '../entities/shopping/shopping.dart';

abstract class ShoppingRepository {
  Future<Either<CommonFailure, List<ShoppingList>>> getShoppingLists(
    String userId,
  );

  Future<Either<CommonFailure, ShoppingList>> getShoppingListById(String id);

  Future<Either<CommonFailure, ShoppingList>> createShoppingList(
    ShoppingList list,
  );

  Future<Either<CommonFailure, ShoppingList>> updateShoppingList(
    ShoppingList list,
  );

  Future<Either<CommonFailure, void>> deleteShoppingList(String id);

  Future<Either<CommonFailure, ShoppingItem>> addItemToList(
    String listId,
    ShoppingItem item,
  );

  Future<Either<CommonFailure, ShoppingItem>> updateItem(ShoppingItem item);

  Future<Either<CommonFailure, void>> deleteItem(String itemId);

  Future<Either<CommonFailure, List<ShoppingItem>>> generateListFromRecipe(
    String recipeId,
  );

  Future<Either<CommonFailure, Budget>> getBudget(String userId);

  Future<Either<CommonFailure, Budget>> updateBudget(Budget budget);
}
