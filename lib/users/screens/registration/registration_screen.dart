import 'package:flutter/material.dart';
import 'package:myapp/theme.dart';
import 'package:myapp/users/components/form_field.dart';
import 'package:myapp/users/config/userPreferences/user_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final PageController _pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  final _formKeyPage2 = GlobalKey<FormState>();
  final _formKeyPage3 = GlobalKey<FormState>();

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _tempatLahirController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _pekerjaanController = TextEditingController();
  final TextEditingController _instansiController = TextEditingController();
  final TextEditingController _unitKerjaController = TextEditingController();
  final TextEditingController _pangkatJabatanController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final preferences = await RememberUserPreferences.readUserInfo();
    setState(() {
      _fullnameController.text = preferences?.fullname ?? '';
      _emailController.text = preferences?.email ?? '';
      _phoneController.text = preferences?.phone ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: primaryColor, title: Text('Registration')),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Format(
                  hintText: "Masukkan nama lengkap tanpa gelar",
                  labelText: "Nama Lengkap (Tanpa Gelar)",
                  controller: _fullnameController,
                ),
                SizedBox(height: 15),
                Format(
                  hintText: "Masukkan email",
                  labelText: "Email",
                  controller: _emailController,
                ),
                SizedBox(height: 15),
                Format(
                  hintText: "Masukkan nomor telepon",
                  labelText: "Nomor Telepon",
                  controller: _phoneController,
                ),
                SizedBox(height: 15),
                
              ],
            ),
          ),
        ));
  }

  Widget _buildPage1() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _fullnameController,
              decoration: InputDecoration(labelText: 'Full Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage2() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKeyPage2,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _nikController,
              decoration: InputDecoration(labelText: 'NIK'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your NIK';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _tempatLahirController,
              decoration: InputDecoration(labelText: 'Tempat Lahir'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your place of birth';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _tanggalLahirController,
              decoration: InputDecoration(labelText: 'Tanggal Lahir'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your date of birth';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKeyPage2.currentState?.validate() ?? false) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage3() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKeyPage3,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _pekerjaanController,
              decoration: InputDecoration(labelText: 'Pekerjaan'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your occupation';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _instansiController,
              decoration: InputDecoration(labelText: 'Instansi'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your institution';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _unitKerjaController,
              decoration: InputDecoration(labelText: 'Unit Kerja'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your work unit';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _pangkatJabatanController,
              decoration: InputDecoration(labelText: 'Pangkat/Jabatan'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your rank/position';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKeyPage3.currentState?.validate() ?? false) {
                  // Handle form submission
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registration Complete')),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
