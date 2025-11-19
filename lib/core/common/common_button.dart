import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
   final Color? buttonColor;
  const CommonButton({
    super.key,
    required this.text,
    this.onTap,
    this.leadingIcon,
    this.trailingIcon,
    this.buttonColor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: buttonColor ?? appColorDeepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon != null) ...[
              Icon(leadingIcon, color: Colors.white,size: 20,),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style:bodyLargeStyle.copyWith(color: kWhite),
            ),
            if (trailingIcon != null) ...[
              const SizedBox(width: 8),
              Icon(trailingIcon, color: Colors.white),
            ],
          ],
        ),
      ),
    );
  }
}
