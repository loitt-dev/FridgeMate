import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../entities/shopping/shopping.dart';
import '../../repositories/shopping_repository.dart';
import '../base_use_case.dart';

class AddToShoppingListUseCase
    implements UseCase<ShoppingItem, AddToShoppingListParams> {
  final ShoppingRepository _repository;

  AddToShoppingListUseCase(this._repository);

  @override
  Future<Either<CommonFailure, ShoppingItem>> call(
    AddToShoppingListParams params,
  ) async {
    return await _repository.addItemToList(params.listId, params.item);
  }
}

class AddToShoppingListParams {
  final String listId;
  final ShoppingItem item;

  const AddToShoppingListParams({required this.listId, required this.item});
}
