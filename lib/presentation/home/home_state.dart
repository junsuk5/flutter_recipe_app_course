import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  HomeState({
    List<String> categories = const [],
    this.selectedCategory = 'All',
    List<Recipe> dishes = const [],
    List<Recipe> newRecipes = const [],
    this.name = '',
  }) : categories = List.unmodifiable(categories),
       dishes = List.unmodifiable(dishes),
       newRecipes = List.unmodifiable(newRecipes);

  @override
  final List<String> categories;
  @override
  final String selectedCategory;
  @override
  final List<Recipe> dishes;
  @override
  final List<Recipe> newRecipes;
  @override
  final String name;
}
