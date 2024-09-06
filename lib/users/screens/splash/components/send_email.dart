import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SendEmail extends StatelessWidget {
  void _contact() async {
    const url = 'mwa-ui@ui.ac.id';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  const SendEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Icon(Icons.email),
        onTap: () {
          _contact();
        });
  }
}
