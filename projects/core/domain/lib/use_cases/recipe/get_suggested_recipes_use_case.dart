import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../entities/recipe/recipe_exports.dart';
import '../../repositories/recipe_repository.dart';
import '../base_use_case.dart';

class GetSuggestedRecipesUseCase
    implements UseCase<List<Recipe>, GetSuggestedRecipesParams> {
  final RecipeRepository _repository;

  GetSuggestedRecipesUseCase(this._repository);

  @override
  Future<Either<CommonFailure, List<Recipe>>> call(
    GetSuggestedRecipesParams params,
  ) async {
    return await _repository.getSuggestedRecipes(
      availableIngredients: params.availableIngredients,
      categoryId: params.categoryId,
      limit: params.limit,
    );
  }
}

class GetSuggestedRecipesParams {
  final List<String>? availableIngredients;
  final String? categoryId;
  final int? limit;

  const GetSuggestedRecipesParams({
    this.availableIngredients,
    this.categoryId,
    this.limit,
  });
}
