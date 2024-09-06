import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:myapp/users/components/form_field.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/users/config/api.dart';
import 'package:myapp/users/config/userPreferences/user_preferences.dart';
import 'package:myapp/users/models/user.dart';
import 'package:myapp/users/screens/init/initial_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  var isObscure = true.obs;

  userLogin() async {
    try {
      var res = await http.post(
        Uri.parse(Api.signInApi),
        body: {
          "email": email.text.trim(),
          "password": password.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodySignIn = jsonDecode(res.body);
        if (resBodySignIn["success"] == true) {
          Fluttertoast.showToast(msg: "Login successfully");

          User userInfo = User.fromJson(resBodySignIn["userData"]);
          await RememberUserPreferences.storeUserInfo(userInfo);

          Future.delayed(const Duration(seconds: 5), () {
            Get.offAll(() => const InitialScreen());
          });
        } else {
          Fluttertoast.showToast(msg: "Incorrect email or password");
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: (e).toString());
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        //email
        Format(
          keyboardType: TextInputType.emailAddress,
          hintText: "Enter your email",
          labelText: "Email",
          controller: email,
          validator: (value) => value == "" ? "Please enter your email" : null,
        ),
        const SizedBox(height: 20),

        //password
        Obx(
          () => Format(
            obscureText: isObscure.value,
            hintText: "Enter your password",
            labelText: "Password",
            controller: password,
            validator: (value) =>
                value == "" ? "Please enter your password" : null,
            suffix: Obx(
              () => GestureDetector(
                onTap: () {
                  isObscure.value = !isObscure.value;
                },
                child: Icon(
                  isObscure.value ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              userLogin();
            }
          },
          child: const Text("Login"),
        )
      ]),
    );
  }
}
