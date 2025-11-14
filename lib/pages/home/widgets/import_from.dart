import 'package:ai_recipe/core/theme/app_colors.dart';
import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ImportFrom extends StatelessWidget {
  const ImportFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: roundedDecoration.copyWith(
        color: kWhite,
        border: Border.all(color: kWhiteF7),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: roundedDecoration.copyWith(
                  color: kBlack,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset("images/kitchen.jpg", fit: BoxFit.cover)
                ),
              ),
              Positioned(
                top: 0,
                left: 16,
                bottom: 30,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Import from\nGallery",
                    style: titleLargeStyle.copyWith(
                      color: kWhite,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Extract recipes from cooking websites, YouTub videos,instagram posts, TikTok videos, and food blogs. Just pasts any recipe link and we'll do the rest.",
                  textAlign: TextAlign.start,
                  style: bodySmallStyle.copyWith(wordSpacing: 1),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: roundedDecoration.copyWith(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: kWhite,
                          size: 20,
                        ),
                        SizedBox(width: 06),
                        Text(
                          "Import from gallery",
                          style: bodyMediumStyle.copyWith(
                            color: kWhite,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 06),
        ],
      ),
    );
  }
}
