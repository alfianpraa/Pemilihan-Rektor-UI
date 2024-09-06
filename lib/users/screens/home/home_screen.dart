import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/users/config/userPreferences/current_user.dart';
import 'package:myapp/users/screens/home/components/infographics/infographics.dart';
import 'package:myapp/users/screens/home/components/info_rumahsakit/informasi.dart';
import 'package:myapp/users/screens/home/components/persyaratan/persyaratan.dart';
import 'package:myapp/users/screens/home/components/timeline/timeline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome, ${_currentUser.user.fullname}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Apakah Anda Rektor UI Berikutnya?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Pemilihan Rektor UI 2024-2029",
            style: TextStyle(fontSize: 14),
          ),
          Infographics(),
          Timeline(),
          // ProfileRektor(),
          Persyaratan(),
          Informasi()
        ],
      ),
    )));
  }
}
