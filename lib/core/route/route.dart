import 'package:ai_recipe/pages/dashboard/view/dashboard_view.dart';
import 'package:ai_recipe/pages/items_detail/view/show_items_view.dart';
import 'package:flutter/material.dart';
import '../../pages/home/view/home_view.dart';
import '/core/route/route_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const DashboardView());
      case RoutesName.splash:
        // return MaterialPageRoute(builder: (_) => const );
      case RoutesName.itemsView:
        return MaterialPageRoute(builder: (_) => ShowItemsView());
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