import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/theme.dart';
import 'package:myapp/users/components/form_field.dart';
import 'package:myapp/users/config/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myapp/users/screens/sign_in/sign_in_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> _updateProfile() async {
    try {
      var response = await http.post(
        Uri.parse(Api.updateProfileApi),
        body: {
          'id': '1', // ID user yang ingin diupdate
          'fullname': fullnameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Profile updated successfully!')));
          Get.off(() => const SignInscreen());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${jsonResponse['message']}')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Server error!')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: const AssetImage("assets/images/man.png"),
                ),
                SizedBox(height: 20),
                Format(
                  hintText: "Masukkan nama lengkap anda",
                  labelText: "Nama Lengkap",
                  controller: fullnameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama lengkap tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Format(
                  hintText: "Masukkan email anda",
                  labelText: "Email",
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Format(
                  hintText: "Masukkan nomor telepon anda",
                  labelText: "Nomor Telepon",
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nomor telepon tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.dialog(
                        AlertDialog(
                          title: const Text("Update Profile"),
                          content: const Text(
                              "Setelah melakukan update akan diarahkan ke halaman login, apakah anda setuju?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () {
                                _updateProfile();
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text("Confirm"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
