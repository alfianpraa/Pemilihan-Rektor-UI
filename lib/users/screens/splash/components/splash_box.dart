import 'package:flutter/material.dart';

class SplashBox extends StatelessWidget {
  const SplashBox({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    this.press,
  });

  final String name;
  final IconData icon;
  final Color color;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: 90,
        height: 110,
        child: Column(
          children: [
            GestureDetector(
              onTap: press,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(icon, size: 30),
              ),
            ),
          Spacer(),
          Text(name, style: TextStyle(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}
