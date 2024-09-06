import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/users/config/userPreferences/user_preferences.dart';
import 'package:myapp/users/screens/splash/splash_screen.dart';

signOutUser() async {
  var resultResponse = await Get.dialog(
    AlertDialog(
      title: const Text("Log Out"),
      content: const Text("Are you sure you want to log out?"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: "loggedOut");
          },
          child: const Text("Yes"),
        ),
      ],
    ),
  );
  if (resultResponse == "loggedOut") {
    RememberUserPreferences.removeUserInfo().then(
      (value) {
        Get.offAll(() => const SplashScreen());
      },
    );
  }
}
