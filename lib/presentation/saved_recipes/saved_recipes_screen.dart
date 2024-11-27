import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/recipe_card.dart';

import '../../domain/model/recipe.dart';
import '../../ui/text_styles.dart';

class SavedRecipesScreen extends StatelessWidget {
  final List<Recipe> recipes;

  const SavedRecipesScreen({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved recipes',
          style: TextStyles.mediumTextBold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(recipe: recipes[index]);
          },
        ),
      ),
    );
  }
}
