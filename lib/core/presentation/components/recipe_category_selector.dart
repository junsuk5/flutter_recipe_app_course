import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class RecipeCategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final void Function(String category) onSelectCategory;

  const RecipeCategorySelector({
    super.key,
    required this.categories,
    required this.onSelectCategory,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((e) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onSelectCategory(e),
            child: e == selectedCategory
                ? SelectedCategory(category: e)
                : UnSelectedCategory(category: e),
          );
        }).toList(),
      ),
    );
  }
}

class UnSelectedCategory extends StatelessWidget {
  final String category;

  const UnSelectedCategory({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Text(
        category,
        style: TextStyles.smallerTextBold.copyWith(
          color: ColorStyles.primary80,
        ),
      ),
    );
  }
}

class SelectedCategory extends StatelessWidget {
  final String category;

  const SelectedCategory({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorStyles.primary100,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7,
      ),
      child: Text(
        category,
        style: TextStyles.smallerTextBold.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
