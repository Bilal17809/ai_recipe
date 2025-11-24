import 'package:ai_recipe/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

extension DecorationExtension on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  BoxDecoration get roundedDecorationWithShadow => BoxDecoration(
    color: isDark ? const Color(0xff1E1E1E) : Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      if (!isDark)
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.2),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
    ],
  );

  BoxDecoration get roundedGreenBorderDecoration =>
      BoxDecoration(
        color:isDark? Color(0xff292524)  :Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color:isDark?const Color(0xff3A3A3A) :Colors.grey.shade300),
      );
      
  
  BoxDecoration get changeButtonDec => BoxDecoration(
    color: isDark ? null : kWhiteF7,
    border: Border.all(color: isDark ? appColorDeepPurple : kWhiteF7),
    borderRadius: BorderRadius.circular(10),
  );

}
