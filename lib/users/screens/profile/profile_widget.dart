import 'package:flutter/material.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: 210,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 4),
              Text(name),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.name,
    required this.color,
    required this.onTap,
  });

  final String name;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: Center(
            child: Text(name),
          ),
        ),
      ),
    );
  }
}
