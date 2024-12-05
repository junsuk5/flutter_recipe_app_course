import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  const GetCategoriesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<String>> execute() async {
    final recipes = await _recipeRepository.getRecipes();
    return [
      'All',
      ...recipes.map((e) => e.category).toSet(),
    ];
  }
}
