import 'package:flutter_recipe_app_course/domain/model/ingredient.dart';
import 'package:flutter_recipe_app_course/domain/model/procedure.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_state.freezed.dart';

part 'ingredient_state.g.dart';

@freezed
class IngredientState with _$IngredientState {
  const factory IngredientState({
    Recipe? recipe,
    @Default([]) List<Ingredient> ingredients,
    @Default([]) List<Procedure> procedures,
    @Default(0) int selectedTabIndex,
  }) = _IngredientState;

  factory IngredientState.fromJson(Map<String, Object?> json) => _$IngredientStateFromJson(json);
}