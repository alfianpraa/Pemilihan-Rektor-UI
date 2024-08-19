import 'package:flutter/material.dart';
import 'package:myapp/screens/otp/email_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, EmailScreen.routeName),
          child: const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 255, 145, 2)),
          ),
        ),
      ],
    );
  }
}
