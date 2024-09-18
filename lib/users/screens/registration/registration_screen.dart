import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/theme.dart';
import 'package:myapp/users/components/form_field.dart';
import 'package:myapp/users/config/api.dart';
import 'package:myapp/users/config/userPreferences/user_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _firstTitleController = TextEditingController();
  final _lastTitleController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nikController = TextEditingController();
  final _birthPlaceController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _addressController = TextEditingController();
  final _jobController = TextEditingController();
  final _unitController = TextEditingController();
  final _positionController = TextEditingController();
  File? _imageFile;
  File? _pdfFile;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      setState(() {
        _imageFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        _pdfFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() &&
        _imageFile != null &&
        _pdfFile != null) {
      try {
        var uri = Uri.parse(Api.registApi);
        var request = http.MultipartRequest('POST', uri)
          ..fields['fullname'] = _fullNameController.text
          ..fields['first_title'] = _firstTitleController.text
          ..fields['last_title'] = _lastTitleController.text
          ..fields['email'] = _emailController.text
          ..fields['phone'] = _phoneController.text
          ..fields['nik'] = _nikController.text
          ..fields['birth_place'] = _birthPlaceController.text
          ..fields['birth_date'] = _birthDateController.text
          ..fields['address'] = _addressController.text
          ..fields['job'] = _jobController.text
          ..fields['unit'] = _unitController.text
          ..fields['position'] = _positionController.text
          ..files.add(
            http.MultipartFile(
              'photo',
              _imageFile!.readAsBytes().asStream(),
              _imageFile!.lengthSync(),
              filename: _imageFile!.path.split('/').last,
            ),
          )
          ..files.add(
            http.MultipartFile(
              'pdf',
              _pdfFile!.readAsBytes().asStream(),
              _pdfFile!.lengthSync(),
              filename: _pdfFile!.path.split('/').last,
            ),
          );

        var response = await request.send();

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Registration successful')));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Failed to register')));
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill all fields and upload files')));
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final preferences = await RememberUserPreferences.readUserInfo();
    setState(() {
      _fullNameController.text = preferences?.fullname ?? '';
      _emailController.text = preferences?.email ?? '';
      _phoneController.text = preferences?.phone ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Form Pendaftaran \nPemilihan Rektor UI 2024-2029',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Data Diri",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),
              Format(
                controller: _fullNameController,
                hintText: "Masukkan nama lengkap anda",
                labelText: "Nama Lengkap",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama lengkap harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Format(
                controller: _firstTitleController,
                hintText: "Masukkan gelar depan anda",
                labelText: "Gelar Depan",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Gelar depan harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Format(
                controller: _lastTitleController,
                hintText: "Masukkan gelar belakang anda",
                labelText: "Gelar Belakang",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Gelar belakang harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Format(
                controller: _emailController,
                hintText: "Masukkan email anda",
                labelText: "Email",
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Masukkan alamat email yang sesuai';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Format(
                controller: _phoneController,
                hintText: "Masukkan nomor telepon anda",
                labelText: "Nomor Telepon",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telepon harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Format(
                controller: _nikController,
                hintText: "Masukkan NIK anda",
                labelText: "NIK",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIK harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Format(
                controller: _birthPlaceController,
                hintText: "Masukkan tempat lahir anda",
                labelText: "Tempat Lahir",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tempat lahir harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Format(
                controller: _birthDateController,
                hintText: "Masukkan tanggal lahir anda",
                labelText: "Tanggal Lahir (YYYY-MM-DD)",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal lahir harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Format(
                controller: _addressController,
                hintText: "Masukkan alamat anda",
                labelText: "Alamat",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Format(
                controller: _jobController,
                hintText: "Masukkan pekerjaan anda",
                labelText: "Pekerjaan",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pekerjaan harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Format(
                controller: _unitController,
                hintText: "Masukkan unit kerja anda",
                labelText: "Unit Kerja",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unit kerja harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Format(
                controller: _positionController,
                hintText: "Masukkan rank/position anda",
                labelText: "Posisi",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Posisi harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Data Foto",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20),
              _imageFile == null
                  ? Text('No image selected.')
                  : Image.file(
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) =>
                              child,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 250,
                      _imageFile!),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                child:
                    Text(_imageFile != null ? 'Change Photo' : 'Upload Photo'),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Data Pendukung",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20),
              _pdfFile == null
                  ? Text('No PDF selected.')
                  : Text('Selected PDF: ${_pdfFile!.path.split('/').last}'),
              SizedBox(height: 10),
              ElevatedButton(
                
                onPressed: _pickPdf,
                child: Text(
                    _pdfFile != null ? 'Change Dokumen' : 'Upload Dokumen'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
