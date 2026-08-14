import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.onTapSearchField() = OnTapSearchField;
  const factory HomeAction.onSelectCategory(String category) = OnSelectCategory;
  const factory HomeAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
}

