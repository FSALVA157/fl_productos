import 'package:fl_productos/models/models.dart';
import 'package:fl_productos/screens/screens.dart';
import 'package:flutter/material.dart';


class AppRoutes{

  static const initialRoute = "home";

  static final optionsMenu = <RouteModel>[
    RouteModel(route: 'home', icon: Icons.home , name: 'Home Screen', screen: const HomeScreen()),
    RouteModel(route: 'login', icon: Icons.login , name: 'Login Screen', screen: const LoginScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final item in optionsMenu) {
      appRoutes.addAll({
        item.route:(BuildContext context) => item.screen
      });
    }
    
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings setting){
    return MaterialPageRoute(builder: (context){
      return const HomeScreen();
    });
  }





}