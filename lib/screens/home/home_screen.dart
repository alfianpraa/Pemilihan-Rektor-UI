import 'package:flutter/material.dart';
import 'package:myapp/screens/home/components/infographics/infographics.dart';
import 'package:myapp/screens/home/components/info_rumahsakit/informasi.dart';
import 'package:myapp/screens/home/components/persyaratan/persyaratan.dart';
import 'package:myapp/screens/home/components/profile_rektor/profile_rektor.dart';
import 'package:myapp/screens/home/components/timeline/timeline.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
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
          ProfileRektor(),
          Persyaratan(),
          Informasi()
        ],
      ),
    )));
  }
}
