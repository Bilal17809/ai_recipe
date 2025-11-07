import 'package:ai_recipe/pages/recipes/view/recipes_view.dart';
import 'package:ai_recipe/pages/setting/view/setting_view.dart';

import '/pages/dash_board/view/dash_board_view.dart';
import 'package:flutter/material.dart';
import '/pages/home/view/home_view.dart';
import '/core/route/route_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutesName.dashBoard:
        return MaterialPageRoute(builder: (_) => const DashBoardView());
      case RoutesName.recipes:
        return MaterialPageRoute(builder: (_) => const RecipesView());
      case RoutesName.setting:
        return MaterialPageRoute(builder: (_) => const SettingView());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}