import 'package:ai_recipe/core/theme/app_styles.dart';
import 'package:ai_recipe/pages/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dashboard_notifier.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pages = [
      HomeView(),
      const Center(child: Text('🍳 Recipes Screen')),
      const Center(child: Text('🧑‍🍳 Ai Recipes')),
      const Center(child: Text('🧑‍🍳 Your Collection')),
    ];

    return Consumer(
        builder: (context,ref,child){
          final dashboardState = ref.watch(dashBoardProvider);
          final controller = ref.read(dashBoardProvider.notifier);
          return Scaffold(
            body: pages[dashboardState.changeTabIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: dashboardState.changeTabIndex,
              onTap: controller.changeTab,
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey,
              unselectedLabelStyle: bodyMediumStyle,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.import_export_outlined),
                  label: 'Import',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.restaurant_menu),
                  label: 'Recipes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.smart_toy),
                  label: 'Ai_Recipes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Your collection',
                ),
              ],
            ),
          );
        }
    );
  }
}
