import 'package:ai_recipe/core/theme/app_colors.dart';
import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:ai_recipe/pages/home/widgets/import_from.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_notifier.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: kWhiteF7,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title:  Text('Recipe Import ', style: titleLargeStyle.copyWith(color: kWhite),),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(homeProvider);
          final notifier = ref.read(homeProvider.notifier);
          return state.isLoading
              ? Center(child: const CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _CommonButton(icon: Icons.mic,onTap: (){print("Tap onMic");},),
                          SizedBox(width: 06),
                          _CommonButton(icon: Icons.camera_alt_outlined,onTap: (){print("Tap onCamera");},),
                        ],
                      ),
                      SizedBox(height: 16),
                      ImportFrom(),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.light_outlined,color: Colors.deepPurple,),
                          SizedBox(width: 10),
                          Text("Recommended for You",style: titleLargeStyle.copyWith(fontWeight: FontWeight.w800),)
                        ],
                      )
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
