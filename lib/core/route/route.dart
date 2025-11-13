import 'package:flutter/material.dart';
import '../../pages/home/view/home_view.dart';
import '/core/route/route_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutesName.splash:
        // return MaterialPageRoute(builder: (_) => const );
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