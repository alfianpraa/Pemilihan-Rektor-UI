import 'package:flutter/material.dart';

//color
const primaryColor = Color.fromRGBO(255, 251, 218, 1);
const secondaryColor = Color.fromRGBO(255, 187, 112, 1);
const thirdColor = Color.fromRGBO(255, 236, 168, 1);
const textLinkColor = Color.fromARGB(255, 5, 83, 179);

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        brightness: Brightness.light,
        fontFamily: "Poppins",
        scaffoldBackgroundColor: primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(200, 50),
            elevation: 2,
            foregroundColor: Colors.black,
            backgroundColor: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: thirdColor,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: secondaryColor),
        ),
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(textLinkColor))));
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(brightness: Brightness.dark);
  }
}
