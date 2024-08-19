import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/sign_up/sign_up_screen.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = '/otp';
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 251, 218, 1),
        title: const Text(
          "Verify OTP",
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
                    "Verify your email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Masukkan kode OTP yang dikirim melalui email anda",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  OtpTextField(
                    numberOfFields: 6,
                    fillColor: Colors.black.withOpacity(0.1),
                    filled: true,
                    onSubmit: (code) {
                      otpController.text = code;
                    },
                  ),
                  // TextFormField(
                  //   controller: emailController,
                  //   keyboardType: TextInputType.emailAddress,
                  //   decoration: const InputDecoration(
                  //     labelText: 'Email',
                  //     hintText: 'Enter your email',
                  //     floatingLabelBehavior: FloatingLabelBehavior.always,
                  //     contentPadding:
                  //         EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(20)),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        if (EmailOTP.verifyOTP(otp: otpController.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("OTP has been verified"),
                            ),
                          );
                          Get.off(() => const SignUpScreen());
                          //Navigator.pushNamed(context, SignUpScreen.routeName);
                        } else if (otpController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter your OTP"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("OTP is wrong"),
                            ),
                          );
                        }
                      },
                      child: Text("Verify OTP"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
