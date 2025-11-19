import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../theme/app_colors.dart';
import '../theme/app_styles.dart';

class ShowLoading extends StatelessWidget {
  final String? title;
  const ShowLoading({super.key,this.title});
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoadingAnimationWidget.beat(
          color: appColorDeepPurple,
          size: 50,
        ),
        const SizedBox(height: 10),
        Text(
          title ?? "Loading...",
          style: titleSmallStyle,
        ),
      ],
    );
  }
}


class ImageUploadLoading extends StatelessWidget {
  const ImageUploadLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 18,
          width: 18,
          child: CircularProgressIndicator(
            color: kWhite,
            strokeWidth: 2,
          ),
        ),
        SizedBox(width: 12),
        Text(
          "Please wait...",
          style: bodyMediumStyle.copyWith(color: kWhite),
        ),
      ],
    );
  }
}
