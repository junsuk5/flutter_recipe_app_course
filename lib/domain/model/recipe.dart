// Recipe model class
import 'recipe_ingredient.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

part 'recipe.g.dart';

@freezed
@JsonSerializable()
class Recipe with _$Recipe {
  Recipe({
    required this.category,
    required this.id,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required List<RecipeIngredient> ingredients,
    this.isFavorite = false,
  }) : ingredients = List.unmodifiable(ingredients);

  @override
  final String category;
  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String chef;
  @override
  final String time;
  @override
  final double rating;
  @override
  final List<RecipeIngredient> ingredients;
  @override
  final bool isFavorite;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);

  Map<String, Object?> toJson() => _$RecipeToJson(this);
}


class User(final int id);

class User2 {
  final int id;

  User2(this.id);
}
