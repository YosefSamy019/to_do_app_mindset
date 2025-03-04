import 'package:flutter/material.dart';

import '../presentation/resources/app_routes.dart';
import '../presentation/resources/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.routers.keys.first,
      routes: AppRoutes.routers,
      theme: getApplicationTheme(context),
      darkTheme: getApplicationDarkTheme(context),
    );
  }
}
