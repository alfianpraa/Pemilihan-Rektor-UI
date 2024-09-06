import 'package:flutter/material.dart';
import 'package:myapp/admin/components/admin_login_form.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

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
                      Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Sign in as admin",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const AdminLoginForm(),
                      const SizedBox(height: 20),
                    ],
                  )))),
        ));
  }
}
