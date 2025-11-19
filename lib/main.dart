import 'package:ai_recipe/core/route/route_name.dart';
import 'package:ai_recipe/pages/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/route/route.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ai_recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: RoutesName.home,
      // home: const DashboardView(),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
