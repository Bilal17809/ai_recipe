import 'package:ai_recipe/core/common/loading.dart';
import 'package:ai_recipe/pages/recipes/providers/recipes_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/theme/app_styles.dart';
import '../providers/home_notifier.dart';
import 'grid_widget.dart';

class GridList extends StatelessWidget {
  const GridList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(recipesNotifiersProvider);
      if (state.isLoading) {
        return Center(child: ShowLoading());
      }

      if (state.recipesList.isEmpty) {
        return Center(
          child: Text(
            "No recipes found!",
            style: titleLargeStyle.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }

      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.recipesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing:10,
          childAspectRatio: 1,

        ),
        itemBuilder: (context, index) {
          final recipe = state.recipesList[index];
          return ItemsWidget(recipes: recipe);
        },
      );
    });
  }
}


// class GridList extends StatelessWidget {
//   const GridList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, ref, _) {
//       final state = ref.watch(recipesNotifiersProvider);
//       if (state.isLoading) {
//         return const Padding(
//           padding: EdgeInsets.symmetric(vertical: 20),
//           child: Center(child: ShowLoading()),
//         );
//       }
//
//       if (state.recipesList.isEmpty) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: Center(
//             child: Text(
//               "No recipes found!",
//               style: titleLargeStyle.copyWith(
//                 color: Colors.grey,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         );
//       }
//
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Row(
//           //   children: [
//           //     const Icon(Icons.light_outlined, color: Colors.deepPurple),
//           //     const SizedBox(width: 6),
//           //     Text(
//           //       "Recommended for You",
//           //       style: titleLargeStyle.copyWith(
//           //         fontWeight: FontWeight.w800,
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           // const SizedBox(height: 08),
//           GridView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: state.recipesList.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing:10,
//               childAspectRatio: 1,
//
//             ),
//             itemBuilder: (context, index) {
//               final recipe = state.recipesList[index];
//               return ItemsWidget(recipes: recipe);
//             },
//           ),
//         ],
//       );
//     });
//   }
// }

//
// class GridList extends StatelessWidget {
//   const GridList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context,ref,_){
//       final state = ref.watch(homeProvider);
//       return   CustomScrollView(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         slivers: [
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.light_outlined,
//                     color: Colors.deepPurple,
//                   ),
//                   SizedBox(width: 06),
//                   Text(
//                     "Recommended for You",
//                     style: titleLargeStyle.copyWith(
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 04),
//           ),
//
//           if (state.isLoading)
//             const SliverFillRemaining(
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             )
//           else if (state.recipesList.isEmpty)
//             SliverFillRemaining(
//               hasScrollBody: false,
//               child: Center(
//                 child: Text(
//                   "No recipes found!",
//                   style: titleLargeStyle.copyWith(
//                     color: Colors.grey,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             )
//           else
//             SliverGrid(
//               gridDelegate:
//               const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 6,
//                 mainAxisSpacing: 6,
//               ),
//               delegate: SliverChildBuilderDelegate((
//                   context,
//                   index,
//                   ) {
//                 final recipe = state.recipesList[index];
//                 return ItemsWidget(recipes: recipe);
//               }, childCount: state.recipesList.length),
//             ),
//         ],
//       );
//     });
//   }
// }
