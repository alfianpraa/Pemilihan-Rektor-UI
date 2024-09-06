import 'dart:convert';

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:myapp/users/components/form_field.dart';
import 'package:myapp/users/config/api.dart';
import 'package:http/http.dart' as http;

import 'package:myapp/users/screens/otp/otp_screen.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailcontroller = TextEditingController();

    validateEmail() async {
      try {
        var res = await http.post(Uri.parse(Api.validateEmail), body: {
          "email": emailcontroller.text.trim(),
        });
        if (res.statusCode == 200) {
          var resBodyValidateEmail = jsonDecode(res.body);
          if (resBodyValidateEmail["emailFound"] == true) {
            print("Email already registered");
            Fluttertoast.showToast(msg: "Email already registered");
          } else {
            if (await EmailOTP.sendOTP(email: emailcontroller.text)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("OTP has been sent"),
                ),
              );
              Get.to(() => const OtpScreen());
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("OTP failed sent"),
                ),
              );
            }
          }
        }
      } catch (e) {
        print(e.toString());
        Fluttertoast.showToast(msg: e.toString());
      }
    }

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
                  Form(
                      key: formKey,
                      child: Format(
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Enter your Email",
                        labelText: "Email",
                        controller: emailcontroller,
                        validator: (value) =>
                            value == "" ? "Please enter your email" : null,
                      )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          validateEmail();
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
