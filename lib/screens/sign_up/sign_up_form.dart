import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/components/form_field.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  Future<void> insertRecord() async {
    if (fullname.text != "" ||
        email.text != "" ||
        password.text != "" ||
        phone.text != "") {
      try {
        String uri = "http://127.0.0.1:3306/pilrek_api/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          "fullname": fullname.text,
          "email": email.text,
          "password": password.text,
          "phone": phone.text,
        });
        var response = jsonDecode(res.body);
        if (response["success" == "true"]) {
          print("Record Inserted");
        } else {
          print("Some error issues");
        }
        print(response);
      } catch (e) {
        print(e);
      }
    } else {
      print("Please fill all fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //fullname
      Format(
        keyboardType: TextInputType.name,
        hintText: 'Enter your fullname',
        labelText: 'Fullname',
        controller: fullname,
      ),
      const SizedBox(height: 20),

      //email
      Format(
        keyboardType: TextInputType.emailAddress,
        labelText: 'Email',
        hintText: 'Enter your email',
        controller: email,
      ),
      const SizedBox(height: 20),

      //password
      Format(
        obscureText: true,
        labelText: 'Password',
        hintText: 'Enter your password',
        controller: password,
      ),
      const SizedBox(height: 20),

      //phone number
      Format(
        keyboardType: TextInputType.phone,
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        controller: phone,
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          insertRecord();
        },
        child: const Text('Confirm'),
      ),
    ]);
  }
}


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
