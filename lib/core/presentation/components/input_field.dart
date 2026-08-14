import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.smallTextRegular,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: ColorStyles.gray4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: ColorStyles.primary80),
            ),
            hintText: placeHolder,
            hintStyle: TextStyles.smallTextRegular.copyWith(
              color: ColorStyles.gray4,
            ),
          ),
        ),
      ],
    );
  }
}
