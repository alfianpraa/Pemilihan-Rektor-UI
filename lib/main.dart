import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/users/config/userPreferences/user_preferences.dart';
import 'package:myapp/users/screens/init/initial_screen.dart';
import 'package:myapp/users/screens/splash/splash_screen.dart';
import 'package:myapp/theme.dart';

void main() {
  EmailOTP.config(
    appName: "Pemilihan Rektor UI 2024-2029",
    appEmail: "pemilihanrektor@ui.ac.id",
    emailTheme: EmailTheme.v4,
    otpLength: 6,
    otpType: OTPType.numeric,
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Pemilihan Rektor UI 2024-2029",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      home: FutureBuilder(
          future: RememberUserPreferences.readUserInfo(),
          builder: (context, dataSnapShot) {
            if (dataSnapShot.data == null) {
              return const SplashScreen();
            } else {
              return const InitialScreen();
            }
          }),
    );
  }
}
