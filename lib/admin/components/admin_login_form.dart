import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:myapp/admin/screens/admin_dashboard_screen.dart';
import 'package:myapp/users/components/form_field.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/users/config/api.dart';

class AdminLoginForm extends StatefulWidget {
  const AdminLoginForm({super.key});

  @override
  State<AdminLoginForm> createState() => _AdminLoginFormState();
}

class _AdminLoginFormState extends State<AdminLoginForm> {
  var formKey = GlobalKey<FormState>();
  var username = TextEditingController();
  var password = TextEditingController();
  var isObscure = true.obs;

  userLogin() async {
    try {
      var res = await http.post(
        Uri.parse(Api.adminLoginApi),
        body: {
          "username": username.text.trim(),
          "password": password.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodySignIn = jsonDecode(res.body);
        if (resBodySignIn["success"] == true) {
          Fluttertoast.showToast(msg: "Login successfully");
          // User userInfo = User.fromJson(resBodySignIn["userData"]);
          // await rememberUserPreferences.storeUserInfo(userInfo);
          Get.offAll(AdminDashboardScreen());
        } else {
          Fluttertoast.showToast(msg: "Incorrect email or password");
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
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
          hintText: "Enter your username",
          labelText: "Username",
          controller: username,
          validator: (value) =>
              value == "" ? "Please enter your username" : null,
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
