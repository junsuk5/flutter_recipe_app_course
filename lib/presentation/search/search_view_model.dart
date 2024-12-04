import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_recipe_app_course/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;

  SearchViewModel({
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
  }) : _recentSearchRecipeRepository = recentSearchRecipeRepository {
    _loadRecentSearchRecipes();
  }

  SearchState _state = const SearchState();

  SearchState get state => _state;

  void _loadRecentSearchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _recentSearchRecipeRepository.getRecentSearchRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }
}
