import 'package:flutter/material.dart';
import 'package:myapp/config/routes.dart';
import 'package:myapp/screens/splash/splash_screen.dart';
import 'package:myapp/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      themeMode: ThemeMode.system,
      initialRoute:  SplashScreen.routeName,
      routes: routes
    );
  }
}
