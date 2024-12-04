import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  // 상태
  SavedRecipesState _state = SavedRecipesState();

  SavedRecipesState get state => _state;

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase {
    _loadRecipeData();
  }

  void _loadRecipeData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _getSavedRecipesUseCase.execute(),
      isLoading: false,
    );
    // 상태 업데이트
    notifyListeners();
  }
}
