import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../entities/shopping/shopping.dart';
import '../../repositories/shopping_repository.dart';
import '../base_use_case.dart';

class CreateShoppingListUseCase implements UseCase<ShoppingList, ShoppingList> {
  final ShoppingRepository _repository;

  CreateShoppingListUseCase(this._repository);

  @override
  Future<Either<CommonFailure, ShoppingList>> call(ShoppingList params) async {
    return await _repository.createShoppingList(params);
  }
}
