import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_state.freezed.dart';

@freezed
class SavedRecipesState with _$SavedRecipesState {
  const factory SavedRecipesState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
  }) = _SavedRecipesState;
}