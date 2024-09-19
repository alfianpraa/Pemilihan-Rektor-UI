import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/theme.dart';
import 'package:myapp/users/config/api.dart';
import 'dart:convert';

class ViewRegistration extends StatefulWidget {
  @override
  _ViewRegistrationState createState() => _ViewRegistrationState();
}

class _ViewRegistrationState extends State<ViewRegistration> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final response = await http.get(
          Uri.parse(Api.viewRegistrationsApi)); // Ganti dengan URL server Anda

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

  // Menampilkan dialog untuk mengedit pengguna
  void editUser(Map<String, dynamic> user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(user['fullname']),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Fullname :  ${user['first_title']} ${user['fullname']} ${user['last_title']}',
                ),
                Text('Email : ${user['email']}'),
                Text('Phone : ${user['phone']}'),
                Text('NIK : ${user['nik']}'),
                Text('Birth Place : ${user['birth_place']}'),
                Text('Birth Date : ${user['birth_date']}'),
                Text('Address : ${user['address']}'),
                Text('Job : ${user['job']}'),
                Text('Unit : ${user['unit']}'),
                Text('Position : ${user['position']}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
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
        title: Text('List Registrasi Calon Rektor'),
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
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                editUser(users[index]);
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
