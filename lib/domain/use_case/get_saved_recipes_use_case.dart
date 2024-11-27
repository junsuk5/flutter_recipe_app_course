import 'package:flutter_recipe_app_course/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

import '../model/recipe.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  const GetSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  })  : _recipeRepository = recipeRepository,
        _bookmarkRepository = bookmarkRepository;

  Future<List<Recipe>> execute() async {
    final ids = await _bookmarkRepository.getBookmarkedIds();
    final recipes = await _recipeRepository.getRecipes();
    return recipes.where((e) => ids.contains(e.id)).toList();
  }
}
