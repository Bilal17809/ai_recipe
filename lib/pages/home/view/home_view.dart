import 'package:ai_recipe/core/Utility/Utils.dart';
import 'package:ai_recipe/core/theme/app_colors.dart';
import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:ai_recipe/extension/extension.dart';
import 'package:ai_recipe/pages/home/providers/home_notifier.dart';
import '/pages/home/widgets/grid_list.dart';
import '/pages/home/widgets/import_from.dart';
import 'package:ai_recipe/pages/home/widgets/photo_import_sheet.dart';
import 'package:ai_recipe/pages/home/widgets/text_import_sheet.dart';
import 'package:ai_recipe/pages/home/widgets/voice_import_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =  ref.watch(homeProvider);

    return Scaffold(
      backgroundColor: context.bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Recipe Import ',
          style: titleLargeStyle.copyWith(color: kWhite),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final notifiers = ref.read(homeProvider.notifier);
         return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Flexible(
                           child: Container(
                             width: double.infinity,
                             padding: EdgeInsets.all(10),
                             decoration: roundedDecoration.copyWith(color: kBlack,borderRadius: BorderRadius.circular(10)),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Icon(Icons.webhook_sharp,color: kWhite,size: 20,),
                                 SizedBox(width: 10),
                                 Text("From website",style: titleSmallStyle.copyWith(color: kWhite,fontSize: 14),)
                               ],
                             ),
                           ),
                         ),
                          SizedBox(width: 10),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _CommonButton(
                                icon: Icons.mic,
                                onTap: () {
                                  Utils.show(context, VoiceImportSheet());
                                },
                              ),
                              SizedBox(width: 06),
                              _CommonButton(
                                icon: Icons.camera_alt_outlined,
                                onTap: ()async {
                                  Utils.show(
                                    context,
                                    PhotoImportSheet(onUploadTap: () {}),
                                  );
                                  // Future.delayed(Duration(milliseconds: 300), () {
                                  //   final notifier = ref.read(homeProvider.notifier);
                                  //   notifier.pickFromCamera();
                                  // });
                                },
                              ),

                              SizedBox(width: 06),
                              _CommonButton(
                                icon: Icons.edit,
                                onTap: () {
                                  Utils.show(context, TextImportSheet());
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      ImportFrom(),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.light_outlined, color: Colors.deepPurple),
                          SizedBox(width: 10),
                          Text(
                            "Recommended for You",
                            style: titleLargeStyle.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 08),
                      GridList(),
                      Text(
                        "Ingredients",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.recipeIngredients?.length ?? 0,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.check_circle_outline),
                            title: Text(state.recipeIngredients![index]),
                          );
                        },
                      ),


                      SizedBox(height: 20),

                      /// STEPS
                      Text(
                        "Steps",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
           ListView.builder(
             shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             itemCount: state.recipeSteps?.length ?? 0,
             itemBuilder: (context, index) {
               return ListTile(
                 leading: CircleAvatar(child: Text("${index + 1}")),
                 title: Text(state.recipeSteps![index]),
               );
             },
           ),
           ],
                  ),
                );
        },
      ),
    );
  }
}

class _CommonButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onTap;
  const _CommonButton({super.key, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: roundedDecoration.copyWith(
          color: kBlack,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: kWhite, size: 20),
      ),
    );
  }
}
