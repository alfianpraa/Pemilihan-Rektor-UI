import 'package:flutter/material.dart';
import '../sign_in/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State <SplashScreen> createState() =>  SplashScreenState();
}

class  SplashScreenState extends State <SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(flex: 20),
              const Text("Welcome!",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
              ),
              const Spacer(flex: 20),
              Image.asset("assets/images/logo_ui.png",
                width: 200,
                height: 200, 
              ),
              const Spacer(flex: 20),
              const Text("Pemilihan Rektor\nUniversitas Indonesia" ,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
              ),
              const Spacer(flex: 20),
              ElevatedButton(
                onPressed: () {
                Navigator.pushNamed(context, SignInscreen.routeName);
              }, child: const Text("Continue")
              ),
              const Spacer(flex: 30,)
            ],
        )
      )
      ),
    );
  }
}