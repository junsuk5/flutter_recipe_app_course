import 'package:flutter_recipe_app_course/domain/filter/filter_state.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  SearchState({
    List<Recipe> recipes = const [],
    this.isLoading = false,
    this.searchTitle = 'Recent Search',
    this.resultsCount = '',
    this.filterState = const FilterState(time: 'All', rate: 1, category: 'All'),
    this.query = '',
  }) : recipes = List.unmodifiable(recipes);

  @override
  final List<Recipe> recipes;
  @override
  final bool isLoading;
  @override
  final String searchTitle;
  @override
  final String resultsCount;
  @override
  final FilterState filterState;
  @override
  final String query;
}
