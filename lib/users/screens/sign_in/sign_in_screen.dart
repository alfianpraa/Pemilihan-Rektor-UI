import 'package:flutter/material.dart';
import 'package:myapp/users/screens/sign_in/no_account_text.dart';
import 'package:myapp/users/screens/sign_in/sign_form.dart';

class SignInscreen extends StatelessWidget {
  static String routeName = '/signin';
  const SignInscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 251, 218, 1),
          title: const Text(
            "Sign in",
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
                        "Sign in with your account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SignForm(),
                      const SizedBox(height: 20),
                      const NoAccountText()
                    ],
                  )
                )
              )
            ),
        )
      );
  }
}
