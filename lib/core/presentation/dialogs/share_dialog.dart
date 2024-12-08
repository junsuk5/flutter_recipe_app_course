import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/small_button.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class ShareDialog extends StatelessWidget {
  final String link;
  final void Function(String link) onTapCopyLink;

  const ShareDialog({
    super.key,
    required this.link,
    required this.onTapCopyLink,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      content: SizedBox(
        width: 280,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recipe Link ',
                  style: TextStyles.largeTextBold,
                ),
                const SizedBox(height: 10),
                Text(
                  'Copy recipe link and share your recipe link with  friends and family.',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray2,
                  ),
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      width: 280,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: ColorStyles.gray4,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 14,
                          top: 13,
                        ),
                        child: Text(
                          link,
                          style: TextStyles.smallerTextBold,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: SizedBox(
                        width: 85,
                        height: 43,
                        child: SmallButton(
                          'Copy Link',
                          onPressed: () => onTapCopyLink(link),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Positioned(
              right: 0,
              child: Icon(
                Icons.close,
                size: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
