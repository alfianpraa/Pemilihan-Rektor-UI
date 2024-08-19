import 'package:flutter/material.dart';
import 'package:myapp/theme.dart';

class FileScreen extends StatelessWidget {
  static String routeName = "/file";
  const FileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Form Download")),
      ),
      body: const Padding(padding: EdgeInsets.all(5)),
    );
  }
}
