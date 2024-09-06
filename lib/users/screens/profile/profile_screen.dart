import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/theme.dart';
import 'package:myapp/users/config/userPreferences/current_user.dart';
import 'package:myapp/users/screens/profile/components/sign_out.dart';
import 'package:myapp/users/screens/profile/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
      child: Center(
          child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: const AssetImage("assets/images/man.png"),
          ),
          SizedBox(height: 20),
          ProfileBox(icon: Icons.person, name: _currentUser.user.fullname),
          ProfileBox(icon: Icons.email, name: _currentUser.user.email),
          ProfileBox(icon: Icons.phone, name: _currentUser.user.phone),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileButton(
                name: "Edit Profile",
                color: secondaryColor,
                onTap: () {},
              ),
              ProfileButton(
                name: "Logout",
                color: Colors.red,
                onTap: () {
                  signOutUser();
                },
              )
            ],
          )
        ],
      )),
    ));
  }
}
