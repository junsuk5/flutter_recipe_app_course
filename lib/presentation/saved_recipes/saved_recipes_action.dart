import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_action.freezed.dart';

@freezed
sealed class SavedRecipesAction with _$SavedRecipesAction {
  const factory SavedRecipesAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
  const factory SavedRecipesAction.onTapRecipe(Recipe recipe) = OnTapRecipe;
}

