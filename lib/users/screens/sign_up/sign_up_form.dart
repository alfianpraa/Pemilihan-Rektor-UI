import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:myapp/users/components/form_field.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/users/config/api.dart';
import 'package:myapp/users/models/user.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var formKey = GlobalKey<FormState>();
  var fullname = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var phone = TextEditingController();
  var isObscure = true.obs;

  validateEmail() async {
    try {
      var res = await http.post(Uri.parse(Api.validateEmail), body: {
        "email": email.text.trim(),
      });
      if (res.statusCode == 200) {
        var resBodyValidateEmail = jsonDecode(res.body);
        if (resBodyValidateEmail["emailFound"] == true) {
          print("Email already registered");
          Fluttertoast.showToast(msg: "Email already registered");
        } else {
          registerAccount();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  registerAccount() async {
    User userModel = User(
      1,
      fullname.text.trim(),
      email.text.trim(),
      password.text.trim(),
      phone.text.trim(),
    );

    try {
      var res = await http.post(
        Uri.parse(Api.signUpApi),
        body: userModel.toJson(),
      );

      if (res.statusCode == 200) {
        var resBodySignUp = jsonDecode(res.body);
        if (resBodySignUp["success"] == true) {
          Fluttertoast.showToast(msg: "Account registered successfully");
          setState(() {
            fullname.clear();
            email.clear();
            password.clear();
            phone.clear();
            confirmPassword.clear();
          });
        } else {
          Fluttertoast.showToast(msg: "Some error issues");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != password.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          //fullname
          Format(
            keyboardType: TextInputType.name,
            hintText: 'Enter your fullname',
            labelText: 'Fullname',
            controller: fullname,
            validator: (value) => value == "" ? "Please enter your name" : null,
          ),
          const SizedBox(height: 20),

          //email
          Format(
            keyboardType: TextInputType.emailAddress,
            labelText: 'Email',
            hintText: 'Enter your email',
            controller: email,
            validator: (value) =>
                value == "" ? "Please enter your email" : null,
          ),
          const SizedBox(height: 20),

          //password
          Obx(
            () => Format(
              obscureText: isObscure.value,
              labelText: 'Password',
              hintText: 'Enter your password',
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

          //password
          Obx(
            () => Format(
              obscureText: isObscure.value,
              labelText: 'Confirm Password',
              hintText: 'Enter your password confirmation',
              controller: confirmPassword,
              validator: _validateConfirmPassword,
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

          //phone number
          Format(
            keyboardType: TextInputType.phone,
            labelText: 'Phone Number',
            hintText: 'Enter your phone number',
            controller: phone,
            validator: (value) =>
                value == "" ? "Please enter your phone number" : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                validateEmail();
              }
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myapp/components/form_field.dart';
// import 'package:myapp/screens/init/initial_screen.dart';


// class SignUpForm extends StatefulWidget {
//   const SignUpForm({Key? key}) : super(key: key);

//   @override
//   State<SignUpForm> createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   var newFullName = '';
//   var newEmail = '';
//   var newPassword = '';
//   var newPhone = '';

//   Future<void> _insert() async {
//     print("Connecting to MySQL Server...");
//     final conn = await MySQLConnection.createConnection(
//       host: "127.0.0.1",
//       port: 3306,
//       userName: "root",
//       password: "",
//       databaseName: "pilrek-ui",
//     );

//     await conn.connect();
//     print("Database Connected");

//     var res = await conn.execute(
//       "INSERT INTO users (id, fullname, email, password, phone) VALUES (':id,':fullname',':email', ':password',':phone')",
//       {
//         'id': null, //if you set it auto increment
//         'fullname': newFullName,
//         'email': newEmail,
//         'password': newPassword,
//         'phone': newPhone,
//       },
//     );
//     print(res.affectedRows);

//     await conn.close();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         //fullname
//         Format(
//             keyboardType: TextInputType.name,
//             hintText: 'Enter your fullname',
//             labelText: 'Fullname',
//             onChanged: (text) {
//               newFullName = text;
//             }),
//         const SizedBox(height: 20),

//         //email
//         Format(
//           keyboardType: TextInputType.emailAddress,
//           labelText: 'Email',
//           hintText: 'Enter your email',
//           onChanged: (String text) {
//             newEmail = text;
//           },
//         ),
//         const SizedBox(height: 20),

//         //password
//         Format(
//           obscureText: true,
//           labelText: 'Password',
//           hintText: 'Enter your password',
//           onChanged: (text) {
//             newPassword = text;
//           },
//         ),
//         const SizedBox(height: 20),

//         //phone number
//         Format(
//           keyboardType: TextInputType.phone,
//           labelText: 'Phone Number',
//           hintText: 'Enter your phone number',
//           onChanged: (text) {
//             newPhone = text;
//           },
//         ),
//         const SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () async {
//             _insert();
//             Get.offAll(() => const InitialScreen());
//           },
//           child: const Text('Confirm'),
//         ),
//       ],
//     );
//   }
// }
