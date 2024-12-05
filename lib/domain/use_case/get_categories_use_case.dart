import 'dart:io';

import 'package:flutter_recipe_app_course/core/domain/error/network_error.dart';
import 'package:flutter_recipe_app_course/core/domain/error/result.dart';
import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  const GetCategoriesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<List<String>, NetworkError>> execute() async {
    try {
      final recipes = await _recipeRepository.getRecipes();
      return Result.success([
        'All',
        ...recipes.map((e) => e.category).toSet(),
      ]);
    } on SocketException {
      return const Result.error(NetworkError.noInternet);
    } catch (e) {
      return const Result.error(NetworkError.unknown);
    }
  }
}
