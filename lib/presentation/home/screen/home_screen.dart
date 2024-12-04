import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/search_input_field.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final void Function() onTapSearchField;

  const HomeScreen({
    super.key,
    required this.name,
    required this.onTapSearchField,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello $name',
                      style: TextStyles.largeTextBold,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'What are you cooking today?',
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: ColorStyles.gray3,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyles.secondary40,
                  ),
                  child: Image.asset('assets/image/face.png'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onTapSearchField,
                    child: const IgnorePointer(
                      child: SearchInputField(
                        placeHolder: 'Search Recipe',
                        isReadOnly: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyles.primary100,
                  ),
                  child: const Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
