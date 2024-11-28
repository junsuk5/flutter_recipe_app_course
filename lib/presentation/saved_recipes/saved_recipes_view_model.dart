import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_saved_recipes_use_case.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  // 상태
  List<Recipe> _recipes = [];

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase {
    _loadRecipeData();
  }

  void _loadRecipeData() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _getSavedRecipesUseCase.execute();
    _isLoading = false;
    // 상태 업데이트
    notifyListeners();
  }
}