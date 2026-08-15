import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_state.freezed.dart';

@freezed
class SavedRecipesState with _$SavedRecipesState {
  SavedRecipesState({List<Recipe> recipes = const [], this.isLoading = false})
    : recipes = List.unmodifiable(recipes);

  @override
  final List<Recipe> recipes;
  @override
  final bool isLoading;
}
