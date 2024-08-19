import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/otp/otp_screen.dart';

class EmailScreen extends StatelessWidget {
  static String routeName = '/email';
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 251, 218, 1),
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 19,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    "assets/images/logo_ui.png",
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Register your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Masukkan email aktif anda untuk melanjutkan verifikasi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () async {
                        if (await EmailOTP.sendOTP(
                            email: emailController.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("OTP has been sent"),
                            ),
                          );
                          Navigator.pushNamed(context, OtpScreen.routeName);
                        } else if (emailController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter your email"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("OTP failed sent"),
                            ),
                          );
                        }
                      },
                      child: Text("Send OTP"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
