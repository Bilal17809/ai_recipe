import 'package:ai_recipe/core/theme/app_colors.dart';
import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ShowDetail extends StatelessWidget {
  final String? peopleServe;
  final String? totalTime;
  const ShowDetail({super.key, this.peopleServe, this.totalTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          decoration: BoxDecoration(color: kBlack.withAlpha(10)),
        ),

        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text("data"),

              // VerticalDivide(),
              ShowAboutData(
                icons: Icons.people_alt_outlined,
                title: "serves",
                subTitle: peopleServe,
              ),

              VerticalDivide(),

              ShowAboutData(
                icons: Icons.access_time_outlined,
                title: "Total Time",
                subTitle: totalTime,
              ),
            ],
          ),
        ),

        Container(
          height: 1,
          decoration: BoxDecoration(color: kBlack.withAlpha(10)),
        ),
      ],
    );
  }
}

class VerticalDivide extends StatelessWidget {
  const VerticalDivide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 02),
      child: VerticalDivider(
        color: kBlack.withAlpha(10),
        thickness: 1,
        width: 20,
      ),
    );
  }
}

class ShowAboutData extends StatelessWidget {
  final IconData? icons;
  final String? title;
  final String? subTitle;
  const ShowAboutData({super.key, this.icons, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icons, size: 18, color: Colors.grey),
            SizedBox(width: 02),
            Text(title!, style: bodyLargeStyle.copyWith(color: Colors.grey)),
          ],
        ),
        Text(subTitle!, style: titleMediumStyle),
      ],
    );
  }
}
