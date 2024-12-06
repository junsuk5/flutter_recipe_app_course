import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required int id,
    required String name,
    required String image,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, Object?> json) => _$IngredientFromJson(json);
}