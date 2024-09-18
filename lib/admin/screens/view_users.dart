import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/theme.dart';
import 'package:myapp/users/config/api.dart';
import 'dart:convert';

class ViewUsers extends StatefulWidget {
  @override
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse(Api.viewUsersApi)); // Ganti dengan URL server Anda

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          users = List<Map<String, dynamic>>.from(data);
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      final response = await http.delete(
        Uri.parse(Api.manageUsersApi), // Ganti dengan URL server Anda
        headers: {"Content-Type": "application/json"},
        body: json.encode({'id': id.toString()}),
      );

      if (response.statusCode == 200) {
        fetchUsers(); // Ambil ulang data pengguna setelah menghapus
      } else {
        throw Exception('Failed to delete user');
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  // Menampilkan dialog untuk mengedit pengguna
  void editUser(Map<String, dynamic> user) {
    final fullnameController = TextEditingController(text: user['fullname']);
    final emailController = TextEditingController(text: user['email']);
    final passwordController = TextEditingController(text: user['password']);
    final phoneController = TextEditingController(text: user['phone']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit User'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: fullnameController,
                  decoration: InputDecoration(labelText: 'Nama Lengkap'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Nomor Telepon'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                updateUser({
                  'id': user['id'],
                  'fullname': fullnameController.text,
                  'email': emailController.text,
                  'password': passwordController.text,
                  'phone': phoneController.text,
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Mengupdate pengguna di server
  Future<void> updateUser(Map<String, dynamic> user) async {
    final response = await http.post(
      Uri.parse(Api.manageUsersApi),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user),
    );

    if (response.statusCode == 200) {
      fetchUsers();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('User updated successfully')));
    } else {
      throw Exception('Failed to update user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('List Users'),
      ),
      body: users.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Loading...'),
              ],
            ))
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(users[index]['fullname']),
                            Text(users[index]['email']),
                          ],
                        ),
                        SizedBox(width: 40),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                editUser(users[index]);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                deleteUser(users[index]['id']);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
