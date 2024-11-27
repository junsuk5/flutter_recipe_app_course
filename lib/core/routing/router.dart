import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/routing/route_paths.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_bookmark_repository_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe_app_course/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app_course/presentation/sign_up/sign_up_screen.dart';
import 'package:flutter_recipe_app_course/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) => SignUpScreen(
        onTapSignIn: () => context.go(RoutePaths.signIn),
      ),
    ),
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => SplashScreen(
        onTapStartCooking: () => context.go(RoutePaths.signIn),
      ),
    ),
    GoRoute(
      path: RoutePaths.signIn,
      builder: (context, state) => SignInScreen(
        onTapSignUp: () => context.go(RoutePaths.signUp),
        onTapSignIn: () => context.go(RoutePaths.savedRecipes),
      ),
    ),
    GoRoute(
      path: RoutePaths.savedRecipes,
      builder: (context, state) => FutureBuilder<List<Recipe>>(
        future: GetSavedRecipesUseCase(
          recipeRepository: MockRecipeRepositoryImpl(),
          bookmarkRepository: MockBookmarkRepositoryImpl(),
        ).execute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final recipes = snapshot.data!;

          return SavedRecipesScreen(recipes: recipes);
        },
      ),
    ),
  ],
);
