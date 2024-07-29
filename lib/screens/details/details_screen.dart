import 'package:flutter/material.dart';
import 'package:myapp/theme.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biografi Lengkap"),
         backgroundColor: primaryColor,
      ),
      body: const Center(
        child: Text('Details Screen'),
      ),
    );
  }
}
