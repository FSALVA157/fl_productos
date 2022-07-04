import 'package:fl_productos/app_routes.dart';
import 'package:fl_productos/themes/global_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      //onGenerateInitialRoutes: (setting) => AppRoutes.onGenerateRoute(setting),
      theme: GlobalTheme.lightTheme,
    );
  }
}