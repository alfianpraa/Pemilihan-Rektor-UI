import 'package:flutter/material.dart';
import 'package:myapp/theme.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.text,
    required this.image,
    this.press,
  });

  final String text, image;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        height: 150,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: thirdColor),
        child: GestureDetector(
          onTap: press,
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(height: 5),
              Text(text, maxLines: 2)
            ],
          ),
        ),
      ),
    );
  }
}
