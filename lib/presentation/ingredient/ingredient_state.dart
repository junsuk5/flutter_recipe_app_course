import 'package:flutter_recipe_app_course/domain/model/ingredient.dart';
import 'package:flutter_recipe_app_course/domain/model/procedure.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_state.freezed.dart';

part 'ingredient_state.g.dart';

@freezed
@JsonSerializable()
class IngredientState with _$IngredientState {
  IngredientState({
    this.recipe,
    List<Ingredient> ingredients = const [],
    List<Procedure> procedures = const [],
    this.selectedTabIndex = 0,
  }) : ingredients = List.unmodifiable(ingredients),
       procedures = List.unmodifiable(procedures);

  @override
  final Recipe? recipe;
  @override
  final List<Ingredient> ingredients;
  @override
  final List<Procedure> procedures;
  @override
  final int selectedTabIndex;

  factory IngredientState.fromJson(Map<String, Object?> json) =>
      _$IngredientStateFromJson(json);

  Map<String, Object?> toJson() => _$IngredientStateToJson(this);
}
