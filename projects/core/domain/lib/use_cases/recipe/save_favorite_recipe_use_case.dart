import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../entities/recipe/recipe_exports.dart';
import '../../repositories/recipe_repository.dart';
import '../base_use_case.dart';

class SaveFavoriteRecipeUseCase implements UseCase<Recipe, Recipe> {
  final RecipeRepository _repository;

  SaveFavoriteRecipeUseCase(this._repository);

  @override
  Future<Either<CommonFailure, Recipe>> call(Recipe params) async {
    return await _repository.saveRecipe(params);
  }
}
