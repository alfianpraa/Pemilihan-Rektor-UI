import 'package:flutter/material.dart';
import 'package:myapp/screens/details/details_screen.dart';
import 'package:myapp/screens/otp/email_screen.dart';
import 'package:myapp/screens/otp/otp_screen.dart';
import 'package:myapp/screens/profile/components/contact.dart';
import 'package:myapp/screens/sign_up/sign_up_success.dart';

import '../screens/file/file_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/init/initial_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/dokumen/dokumen_screen.dart';
import '../screens/sign_in/sign_in_screen.dart';
import '../screens/sign_up/sign_up_screen.dart';
import '../screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInscreen.routeName: (context) => const SignInscreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  InitialScreen.routeName: (context) => const InitialScreen(),
  DokumenScreen.routeName: (context) => const DokumenScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  FileScreen.routeName: (context) => const FileScreen(),
  SignUpSuccess.routeName: (context) => const SignUpSuccess(),
  Contact.routeName: (context) => const Contact(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  EmailScreen.routeName: (context) => const EmailScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
};
