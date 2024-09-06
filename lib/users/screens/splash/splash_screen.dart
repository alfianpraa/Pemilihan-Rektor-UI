import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/admin/screens/admin_login_screen.dart';
import 'package:myapp/users/screens/sign_in/sign_in_screen.dart';
import 'package:myapp/users/screens/splash/components/news_dialog.dart';
import 'package:myapp/users/screens/splash/components/requirement_dialog.dart';
import 'package:myapp/users/screens/splash/components/send_email.dart';
import 'package:myapp/users/screens/splash/components/splash_box.dart';
import 'package:myapp/users/screens/splash/components/timeline_dialog.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/logo_ui.png",
                  width: 35,
                ),
                Row(
                  children: [
                    SendEmail(),
                    SizedBox(width: 15),
                    Icon(Icons.phone),
                    SizedBox(width: 10)
                  ],
                ),
              ],
            ),
            Spacer(flex: 3),
            Image.asset(
              "assets/images/logo pilrek.png",
              width: 200,
            ),
            Spacer(flex: 11),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SplashBox(
                  name: 'News',
                  icon: Icons.newspaper_rounded,
                  color: boxColor1,
                  press: () => showDialog(
                    context: context,
                    builder: (context) => NewsDialog(),
                  ),
                ),
                SplashBox(
                  name: 'Timeline',
                  icon: Icons.timeline,
                  color: boxColor2,
                  press: () => showDialog(
                    context: context,
                    builder: (context) => TimelineDialog(),
                  ),
                ),
                SplashBox(
                    name: 'Requirement',
                    icon: Icons.rule_folder_rounded,
                    color: boxColor3,
                    press: () => showDialog(
                          context: context,
                          builder: (context) => RequirementDialog(),
                        ))
              ],
            ),
            Spacer(flex: 1),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(310, 50)),
              onPressed: () {
                Get.to(() => const SignInscreen());
              },
              child: Text("Login"),
            ),
            Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You\'re an admin?',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const AdminLoginScreen());
                  },
                  child: Text(
                    "Login Here",
                    style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 72, 72, 72)),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

const boxColor1 = Color.fromRGBO(255, 101, 0, 1);
const boxColor2 = Color.fromRGBO(255, 138, 8, 1);
const boxColor3 = Color.fromRGBO(255, 193, 0, 1);
