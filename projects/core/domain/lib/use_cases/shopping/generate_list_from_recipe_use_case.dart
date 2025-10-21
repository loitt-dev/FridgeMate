import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../entities/shopping/shopping.dart';
import '../../repositories/shopping_repository.dart';
import '../base_use_case.dart';

class GenerateListFromRecipeUseCase
    implements UseCase<List<ShoppingItem>, String> {
  final ShoppingRepository _repository;

  GenerateListFromRecipeUseCase(this._repository);

  @override
  Future<Either<CommonFailure, List<ShoppingItem>>> call(String params) async {
    return await _repository.generateListFromRecipe(params);
  }
}
