import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/users/screens/splash/splash_screen.dart';
import 'package:myapp/theme.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Admin Dashboard'),
          backgroundColor: primaryColor,
        ),
        body: const Center(
          child: Text('Welcome to the admin dashboard!'),
        ),
        drawer: Drawer(
          backgroundColor: primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/man.png'),
                ),
                TextButton(
                    onPressed: () {
                      Get.offAll(() => const SplashScreen());
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ))
              ],
            ),
          ),
        ));
  }
}
