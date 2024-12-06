import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/domain/error/network_error.dart';
import 'package:flutter_recipe_app_course/core/domain/error/result.dart';
import 'package:flutter_recipe_app_course/domain/error/new_recipe_error.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_categories_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_new_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_action.dart';

import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getDishesByCategoryUseCase;
  final GetNewRecipesUseCase _getNewRecipesUseCase;

  final _eventController = StreamController<NetworkError>();

  Stream<NetworkError> get eventStream => _eventController.stream;

  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getDishesByCategoryUseCase,
    required GetNewRecipesUseCase getNewRecipesUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        _getDishesByCategoryUseCase = getDishesByCategoryUseCase,
        _getNewRecipesUseCase = getNewRecipesUseCase {
    _fetchCategories();
    _fetchNewRecipes();
  }

  HomeState _state = const HomeState(name: 'Jega');

  HomeState get state => _state;

  void _fetchCategories() async {
    final result = await _getCategoriesUseCase.execute();

    switch (result) {
      case ResultSuccess<List<String>, NetworkError>():
        _state = state.copyWith(
          categories: result.data,
          selectedCategory: 'All',
        );
        notifyListeners();

        await _fetchDishesByCategory('All');
        notifyListeners();
      case ResultError<List<String>, NetworkError>():
        switch (result.error) {
          case NetworkError.requestTimeout:
          case NetworkError.noInternet:
          // TODO: Handle this case.
          case NetworkError.serverError:
          // TODO: Handle this case.
          case NetworkError.unknown:
          // TODO: Handle this case.
        }
        _eventController.add(result.error);
    }
  }

  Future<void> _fetchDishesByCategory(String category) async {
    final dishes = await _getDishesByCategoryUseCase.execute(category);
    _state = state.copyWith(dishes: dishes);
    notifyListeners();
  }

  Future<void> _fetchNewRecipes() async {
    final result = await _getNewRecipesUseCase.execute();

    switch (result) {
      case ResultSuccess<List<Recipe>, NewRecipeError>():
        _state = state.copyWith(newRecipes: result.data);
        notifyListeners();
      case ResultError<List<Recipe>, NewRecipeError>():
        switch(result.error) {
          case NewRecipeError.noRecipe:
            // TODO: Handle this case.
          case NewRecipeError.invalidCategory:
            // TODO: Handle this case.
          case NewRecipeError.unknown:
            // TODO: Handle this case.
        }
    }
  }

  void _onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await _fetchDishesByCategory(category);
  }

  void onAction(HomeAction action) async {
    switch (action) {
      case OnTapSearchField():
        return;
      case OnSelectCategory():
        _onSelectCategory(action.category);
    }
  }
}
