import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_categories_use_case.dart';

import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;

  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
  }) : _getCategoriesUseCase = getCategoriesUseCase {
    _fetchCategories();
  }

  HomeState _state = const HomeState();

  HomeState get state => _state;

  void _fetchCategories() async {
    _state = state.copyWith(
      categories: await _getCategoriesUseCase.execute(),
      selectedCategory: 'All',
    );
    notifyListeners();
  }

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();
  }
}
