import 'package:flutter_recipe_app_course/data/data_source/local/default_local_storage.dart';
import 'package:flutter_recipe_app_course/data/data_source/remote/remote_recipe_data_source_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_bookmark_repository_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_recent_search_recipe_repository_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe_app_course/domain/data_source/local_storage.dart';
import 'package:flutter_recipe_app_course/domain/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app_course/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app_course/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app_course/presentation/search/search_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  // data source
  getIt.registerSingleton<RecipeDataSource>(RemoteRecipeDataSourceImpl());
  getIt.registerSingleton<LocalStorage>(DefaultLocalStorage());

  // Repository
  getIt.registerSingleton<RecipeRepository>(
    MockRecipeRepositoryImpl(
      recipeDataSource: getIt(),
    ),
  );
  getIt.registerSingleton<BookmarkRepository>(MockBookmarkRepositoryImpl());
  getIt.registerSingleton<RecentSearchRecipeRepository>(
    MockRecentSearchRecipeRepositoryImpl(
      localStorage: getIt(),
    ),
  );

  // UseCase
  getIt.registerSingleton(
    GetSavedRecipesUseCase(
      recipeRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );
  getIt.registerSingleton(
    SearchRecipesUseCase(
      recipeRepository: getIt(),
      localStorage: getIt(),
    ),
  );

  // ViewModel
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      getSavedRecipesUseCase: getIt(),
    ),
  );
  getIt.registerFactory<SearchViewModel>(
    () => SearchViewModel(
      recentSearchRecipeRepository: getIt(),
      searchRecipesUseCase: getIt(),
    ),
  );
}