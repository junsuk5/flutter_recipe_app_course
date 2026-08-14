import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class MediumButton extends StatefulWidget {
  final String text;
  final void Function() onPressed;

  const MediumButton(
    this.text, {
    super.key,
    required this.onPressed,
  });

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isPressed ? ColorStyles.gray4 : ColorStyles.primary100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyles.normalTextBold.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 11),
            const Icon(
              Icons.arrow_forward,
              size: 20,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
