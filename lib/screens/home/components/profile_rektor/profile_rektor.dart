import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/screens/details/details_screen.dart';
import 'package:myapp/screens/home/components/profile_rektor/profile_card.dart';

class ProfileRektor extends StatelessWidget {
  const ProfileRektor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Calon Rektor",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              ])),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ProfileCard(
                  text: "Rektor 1",
                  image: "assets/images/man.png",
                  press: () => Navigator.pushNamed(context, DetailsScreen.routeName),
                ),
                ProfileCard(
                  text: "Rektor 2",
                  image: "assets/images/man.png",
                  press: () => Navigator.pushNamed(context, DetailsScreen.routeName),
                ),
                ProfileCard(
                  text: "Rektor 3",
                  image: "assets/images/man.png",
                  press: () => Navigator.pushNamed(context, DetailsScreen.routeName),
                ),
                ProfileCard(
                  text: "Rektor 4",
                  image: "assets/images/man.png",
                  press: () => Navigator.pushNamed(context, DetailsScreen.routeName),
                ),
                ProfileCard(
                  text: "Rektor 5",
                  image: "assets/images/man.png",
                  press: () => Navigator.pushNamed(context, DetailsScreen.routeName),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
