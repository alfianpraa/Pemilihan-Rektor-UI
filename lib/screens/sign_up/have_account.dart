import 'package:flutter/material.dart';
import 'package:myapp/screens/sign_in/sign_in_screen.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignInscreen.routeName),
          child: const Text(
            "Login",
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 255, 145, 2)),
          ),
        ),
      ],
    );
  }
}