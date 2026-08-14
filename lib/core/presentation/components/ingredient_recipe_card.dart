import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class IngredientRecipeCard extends StatelessWidget {
  final Recipe recipe;
  final void Function(Recipe recipe) onTapFavorite;

  const IngredientRecipeCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 315 / 150,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(recipe.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Row(
                  children: [
                    const Icon(
                      Icons.alarm,
                      color: Colors.white,
                      size: 17,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      recipe.time,
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => onTapFavorite(recipe),
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(3),
                          child: const Icon(
                            Icons.bookmark_border_outlined,
                            color: ColorStyles.primary80,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 37,
                  height: 16,
                  decoration: BoxDecoration(
                    color: ColorStyles.secondary20,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 12,
                        color: ColorStyles.rating,
                      ),
                      Text(
                        recipe.rating.toString(),
                        style: TextStyles.smallerTextRegular,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 194,
                  child: Text(
                    recipe.name,
                    maxLines: 2,
                    style: TextStyles.smallTextBold,
                  ),
                ),
                const Spacer(),
                const Text(
                  '(13k Reviews)',
                  style: TextStyle(
                    color: ColorStyles.gray3,
                  ),
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
