import 'package:ai_recipe/core/theme/app_colors.dart';
import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class BottomSheetsHeader extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? subTitle;
  const BottomSheetsHeader({super.key,
    required this.title, this.icon, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Icon(Icons.arrow_back, size: 22),
        ),

        SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: bodyLargeStyle.copyWith(
                  color: kBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),

              if (subTitle != null && icon != null) ...[
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(icon, size: 18, color: Colors.grey),
                    SizedBox(width: 03),
                    Text(
                      subTitle!,
                      style: bodySmallStyle.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close),
        ),
      ],
    );
  }
}
