import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/admin/screens/view_users.dart';
import 'package:myapp/theme.dart';
import 'package:myapp/users/screens/splash/splash_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Dashboard Admin'),
      ),
      drawer: Drawer(
        backgroundColor: primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('List Users'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewUsers()),
                ); // // Tutup drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text('List Registrasi Calon Rektor'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                // Navigasi ke halaman pengaturan
              },
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Log Out'),
              onTap: () {
                Get.offAll(() => const SplashScreen());
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to Dashboard Admin!'),
      ),
    );
  }
}
