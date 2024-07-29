import 'package:flutter/material.dart';
import 'package:myapp/screens/init/initial_screen.dart';

class SignUpSuccess extends StatelessWidget {
  static String routeName = "/signupsuccess";
  const SignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Spacer(flex: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Thank you! \n your account successfully registered",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const Spacer(flex: 5),
              Image.asset("assets/images/check image.png",
                width: 150,
                height: 150, 
              ),
              const Spacer(flex: 5),
              ElevatedButton(
                onPressed: () {
                Navigator.pushNamed(context, InitialScreen.routeName);
              }, child: const Text("Go to Home")
              ),
              const Spacer(flex: 30,)
            ],
        )
      )
      ),
    );
  }
}