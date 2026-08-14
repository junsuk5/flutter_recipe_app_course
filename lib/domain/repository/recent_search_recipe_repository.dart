import 'package:flutter_recipe_app_course/domain/model/recipe.dart';

abstract interface class RecentSearchRecipeRepository {
  Future<List<Recipe>> getRecentSearchRecipes();

  Future<void> updateRecentSearchRecipes(List<Recipe> recipes);
}
