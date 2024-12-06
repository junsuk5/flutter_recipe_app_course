import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/chef_profile.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/ingredient_item.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/ingredient_recipe_card.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/procedure_item.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/two_tab.dart';
import 'package:flutter_recipe_app_course/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe_app_course/presentation/ingredient/ingredient_state.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class IngredientScreen extends StatelessWidget {
  final IngredientState state;
  final void Function(IngredientAction action) onAction;

  const IngredientScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              IngredientRecipeCard(
                recipe: state.recipe!,
                onTapFavorite: (recipe) {},
              ),
              const SizedBox(height: 10),
              const ChefProfile(),
              const SizedBox(height: 20),
              TwoTab(
                selectedIndex: state.selectedTabIndex,
                labels: const [
                  'Ingredient',
                  'Procedure',
                ],
                onChange: (index) {
                  if (index == 0) {
                    onAction(const IngredientAction.onTapIngredient());
                  } else {
                    onAction(const IngredientAction.onTapProcedure());
                  }
                },
              ),
              const SizedBox(height: 35),
              Expanded(
                child: IndexedStack(
                  index: state.selectedTabIndex,
                  children: [
                    IngredientList(state: state),
                    ProcedureList(state: state),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProcedureList extends StatelessWidget {
  const ProcedureList({
    super.key,
    required this.state,
  });

  final IngredientState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.room_service,
              size: 17,
              color: ColorStyles.gray3,
            ),
            const SizedBox(width: 5),
            Text(
              '1 serve',
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
            const Spacer(),
            Text(
              '${state.procedures.length} Steps',
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 23.5),
        Expanded(
          child: ListView.builder(
            itemCount: state.procedures.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ProcedureItem(
                    procedure: state.procedures[index],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class IngredientList extends StatelessWidget {
  const IngredientList({
    super.key,
    required this.state,
  });

  final IngredientState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.room_service,
              size: 17,
              color: ColorStyles.gray3,
            ),
            const SizedBox(width: 5),
            Text(
              '1 serve',
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
            const Spacer(),
            Text(
              '${state.ingredients.length} Items',
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 23.5),
        Expanded(
          child: ListView.builder(
            itemCount: state.ingredients.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  IngredientItem(
                    ingredient: state.ingredients[index],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}