import 'package:flutter/material.dart';
import 'package:myapp/screens/sign_up/have_account.dart';
import 'package:myapp/screens/sign_up/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 251, 218, 1),
          title: const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 19,
            ),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        "assets/images/logo_ui.png",
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Register your account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SignUpForm(),
                      const SizedBox(height: 20),
                      const HaveAccount(),
                    ],
                  )
                )
              )
            ),
        )
      );
  }
}