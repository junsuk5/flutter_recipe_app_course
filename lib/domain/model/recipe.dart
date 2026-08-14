// Recipe model class
import 'recipe_ingredient.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String category,
    required int id,
    required String name,
    required String image,
    required String chef,
    required String time,
    required double rating,
    required List<RecipeIngredient> ingredients,
    @Default(false) bool isFavorite,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}

