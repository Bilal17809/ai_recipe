import 'package:ai_recipe/core/common/positioned.dart';
import 'package:ai_recipe/core/theme/app_colors.dart';
import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:ai_recipe/models/models.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  final RecipesModel recipes;
  const ItemsWidget({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
        decoration: roundedDecoration.copyWith(
          color: kBlack,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "images/dish.jpg",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Position(),
            Positioned(
              left: 6,
              right: 6,
              bottom: 4,
              child: Column(
                children: [
                  Text(
                    recipes.title.toString(),
                    style: titleSmallStyle.copyWith(
                      color: kWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ReusableRow(
                        icon: Icons.access_time_outlined,
                        title: recipes.cokeTime,
                      ),
                      _ReusableRow(
                        icon: Icons.people_alt_outlined,
                        title: recipes.people.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReusableRow extends StatelessWidget {
  final IconData? icon;
  final String? title;
  const _ReusableRow({super.key, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: kWhite, size: 18),
        SizedBox(width: 02),
        Text(
          title!,
          style: bodySmallStyle.copyWith(color: kWhite, fontSize: 12),
        ),
      ],
    );
  }
}
