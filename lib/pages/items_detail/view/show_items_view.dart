import 'package:ai_recipe/core/theme/app_colors.dart';
import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:ai_recipe/models/models.dart';
import 'package:ai_recipe/pages/items_detail/widgets/show_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowItemsView extends ConsumerWidget {
  final RecipesModel? recipes;
  const ShowItemsView({super.key, this.recipes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kWhiteF7,
      appBar: AppBar(title: Text(recipes!.title.toString(),
        style:titleMediumStyle.copyWith(color: kWhite),),
        backgroundColor: appColorDeepPurple,
        iconTheme: IconThemeData(color: kWhite),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.30,
              width: double.infinity,
              decoration: roundedDecoration.copyWith(
                color: kBlack,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("images/dish.jpg", fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 06),
            Row(
              children: [
                IconsButtons(onPress: () {}, icons: Icons.favorite_outline),
                SizedBox(width: 06),
                IconsButtons(onPress: () {}, icons: Icons.share_outlined),
              ],
            ),
            SizedBox(height: 06),
            Text(
              recipes!.title.toString(),
              style: titleMediumStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 06),
            // Text(
            //   recipes!.cokeName.toString(),
            //   style: bodyLargeStyle.copyWith(color: Colors.grey),
            // ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kBlack.withAlpha(20),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(recipes!.aboutMoreCoking.toString()),
            ),
            SizedBox(height: 20),
            ShowDetail(
              peopleServe: recipes!.people.toString(),
              totalTime: recipes!.cokeTime,
            ),
            SizedBox(height: 26),
            Text("Ingredients",style: titleLargeStyle,),
            Text("Instructions",style: titleLargeStyle)
            
          ],
        ),
      ),
    );
  }
}

class IconsButtons extends StatelessWidget {
  final VoidCallback? onPress;
  final IconData? icons;
  const IconsButtons({super.key, this.onPress, this.icons});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress, child: Icon(icons));
  }
}
