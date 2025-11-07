import '/pages/home/view/home_view.dart';
import '/pages/recipes/view/recipes_view.dart';
import '/pages/setting/view/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/dash_board_notifier.dart';

class DashBoardView extends ConsumerWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashBoardProvider);
    final notifier = ref.read(dashBoardProvider.notifier);

    final pages = const [
      HomeView(),
      RecipesView(),
      SettingView(),
    ];

    return Scaffold(
      body: pages[state.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.currentIndex,
        onTap: notifier.changeTab,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Recipes'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}


