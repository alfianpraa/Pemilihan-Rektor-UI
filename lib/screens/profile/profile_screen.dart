import 'package:flutter/material.dart';
import 'package:myapp/screens/profile/components/contact.dart';
import 'package:myapp/screens/profile/profile_button.dart';
import 'package:myapp/screens/sign_in/sign_in_screen.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 70),
            const SizedBox(
              height: 90,
              width: 90,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/man.png'),
                radius: 50,
              ),
            ),
            const SizedBox(height: 20),
            ProfileButton(
              icon: "assets/icon/edit.svg",
              text: "Edit Profile",
              press: () => {},
            ),
            ProfileButton(
              icon: "assets/icon/notifications.svg",
              text: "Notifications",
              press: () => {},
            ),
            ProfileButton(
              icon: "assets/icon/phone.svg",
              text: "Contact Us",
              press: () {
                Navigator.of(context).pushNamed(Contact.routeName);
              },
            ),
            ProfileButton(
              icon: "assets/icon/settings.svg",
              text: "Settings",
              press: () => {},
            ),
            ProfileButton(
              icon: "assets/icon/logout.svg",
              text: "Log Out",
              press: () => {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  SignInscreen.routeName,
                  (route) => false,
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
