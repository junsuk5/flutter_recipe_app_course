import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

class GetDishesByCategoryUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  const GetDishesByCategoryUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  })  : _recipeRepository = recipeRepository,
        _bookmarkRepository = bookmarkRepository;

  Future<List<Recipe>> execute(String category) async {
    final recipes = await _recipeRepository.getRecipes();
    final ids = await _bookmarkRepository.getBookmarkedIds();

    return recipes
        .where((e) => category == 'All' || e.category == category)
        .map((e) => e.copyWith(isFavorite: ids.contains(e.id)))
        .toList();
  }
}
