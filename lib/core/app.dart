import 'package:flutter/material.dart';
import 'package:my_app/proximity.dart';

import '../config/router/app_route.dart';
import '../config/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProximityBrightnessControl(child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Appointment App',
      theme: AppTheme.getApplicationTheme(),
      initialRoute: AppRoute.splashRoute,
      // initialRoute: AppRoute.homeRoute,
      // initialRoute: AppRoute.adminRoute,
      routes: AppRoute.getApplicationRoute(),
    ));
  }
}
