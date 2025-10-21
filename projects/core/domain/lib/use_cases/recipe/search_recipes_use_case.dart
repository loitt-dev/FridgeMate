import 'package:dartz/dartz.dart';
import '../../entities/common/failure.dart';
import '../../entities/recipe/recipe_exports.dart';
import '../../repositories/recipe_repository.dart';
import '../base_use_case.dart';

class SearchRecipesUseCase implements UseCase<List<Recipe>, String> {
  final RecipeRepository _repository;

  SearchRecipesUseCase(this._repository);

  @override
  Future<Either<CommonFailure, List<Recipe>>> call(String params) async {
    return await _repository.searchRecipes(params);
  }
}
