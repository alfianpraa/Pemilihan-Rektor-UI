import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:myapp/users/config/userPreferences/current_user.dart';
import 'package:myapp/users/screens/registration/registration_screen.dart';
import 'package:myapp/users/screens/home/home_screen.dart';
import 'package:myapp/users/screens/profile/profile_screen.dart';
import 'package:myapp/users/screens/dokumen/dokumen_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    const HomeScreen(),
    RegistrationScreen(),
    const DokumenScreen(),
    ProfileScreen()
  ];

  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return Scaffold(
          body: pages[currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: updateCurrentIndex,
            currentIndex: currentSelectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icon/home.svg",
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/icon/home.svg",
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(249, 158, 39, 1),
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icon/registration.svg",
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/icon/registration.svg",
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(249, 158, 39, 1),
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "Registration"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icon/file.svg",
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/icon/file.svg",
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(249, 158, 39, 1),
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "File"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icon/profile.svg",
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/icon/profile.svg",
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(249, 158, 39, 1),
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "Profile")
            ],
          ),
        );
      },
    );
  }
}
