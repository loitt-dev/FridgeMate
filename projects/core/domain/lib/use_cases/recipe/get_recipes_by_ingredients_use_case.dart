import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../entities/recipe/recipe_exports.dart';
import '../../repositories/recipe_repository.dart';
import '../base_use_case.dart';

class GetRecipesByIngredientsUseCase
    implements UseCase<List<Recipe>, List<String>> {
  final RecipeRepository _repository;

  GetRecipesByIngredientsUseCase(this._repository);

  @override
  Future<Either<CommonFailure, List<Recipe>>> call(List<String> params) async {
    return await _repository.getRecipesByIngredients(params);
  }
}
