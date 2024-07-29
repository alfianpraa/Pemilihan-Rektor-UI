import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/screens/file/file_screen.dart';
import 'package:myapp/screens/home/home_screen.dart';
import 'package:myapp/screens/profile/profile_screen.dart';
import 'package:myapp/screens/dokumen/dokumen_screen.dart';

class InitialScreen extends StatefulWidget {
  static String routeName = '/';
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
    const DokumenScreen(),
    const FileScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
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
        ));
  }
}
