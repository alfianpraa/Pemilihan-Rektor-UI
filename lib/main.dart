import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/config/routes.dart';
import 'package:myapp/screens/splash/splash_screen.dart';
import 'package:myapp/theme.dart';

void main() {
  EmailOTP.config(
    appName: "Pemilihan Rektor UI 2024-2029",
    appEmail: "pemilihanrektor@ui.ac.id",
    emailTheme: EmailTheme.v4,
    otpLength: 6,
    otpType: OTPType.numeric,
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  //     .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(context),
        initialRoute: SplashScreen.routeName,
        routes: routes);
  }
}
