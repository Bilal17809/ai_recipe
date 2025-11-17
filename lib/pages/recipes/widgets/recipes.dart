import 'package:ai_recipe/core/theme/app_colors.dart';
import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:ai_recipe/models/models.dart';
import '/core/common/positioned.dart';

class Recipes extends StatelessWidget {
  final RecipesModel recipesList;
  final void Function()? onFavTap;

  const Recipes({super.key, required this.recipesList, this.onFavTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: roundedDecoration.copyWith(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipesList.title.toString(),
                    style: bodyMediumStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    recipesList.aboutMoreCoking.toString(),
                    style: bodySmallStyle.copyWith(color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.timer_outlined, size: 16),
                      const SizedBox(width: 5),
                      Text(
                        recipesList.cokeTime.toString(),
                        style: bodySmallStyle,
                      ),
                      const SizedBox(width: 15),
                      const Icon(Icons.people_alt_outlined, size: 16),
                      const SizedBox(width: 5),
                      Text(
                        "${recipesList.people} people",
                        style: bodySmallStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    recipesList.cokeName.toString(),
                    style: bodySmallStyle.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: SizedBox(
                  width: 138,
                  height: 160,
                  child: Image.asset("images/kitchen.jpg", fit: BoxFit.cover),
                ),
              ),
              Position(),
              Positioned(
                bottom: 8,
                right: 6,
                child: GestureDetector(
                  onTap: onFavTap,
                  child: const Icon(Icons.favorite_outline, color: kWhite),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
