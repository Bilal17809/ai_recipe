import 'package:ai_recipe/core/theme/app_colors.dart';
import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CollectionsView extends ConsumerWidget {
  const CollectionsView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title:
      Text("Collections",style: titleMediumStyle.copyWith(color: kWhite),),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: [
             
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add,color: kWhite,),
      ),
    );
  }
}
