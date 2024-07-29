import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/theme.dart';

class InfographicsCard extends StatelessWidget {
  const InfographicsCard({
    super.key,
    required this.title,
    required this.image,
    this.press,
  });

  final String image, title;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 150,
        height: 210,
        decoration: BoxDecoration(
            color: thirdColor, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image),
                SizedBox(
                    child: Text(
                  title,
                  style: const TextStyle(fontSize: 10),
                )),
                const SizedBox(height: 3),
                GestureDetector(
                    onTap: press,
                    child: const Text(
                      'See more..',
                      style: TextStyle(fontSize: 10, color: textLinkColor),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
