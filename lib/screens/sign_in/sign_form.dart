import 'package:flutter/material.dart';
import 'package:myapp/screens/init/initial_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _keyform = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _keyform,
        child: Column(
          children: [
            TextFormField(              
              keyboardType: TextInputType.emailAddress,
              // onSaved: (newValue) => email = newValue,
              // onChanged: (value) {
              //   if (value.isNotEmpty) {
              //     removeError(error: kEmailNullError);
              //   }
              //   if (emailValidatorRegExp.hasMatch(value)) {
              //     removeError(error: kInvalidEmailError);
              //   }
              //   return;
              // },
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     addError(error: kEmailNullError);
              //     return "";
              //   } else if (!emailValidatorRegExp.hasMatch(value)) {
              //     addError(error: kInvalidEmailError);
              //     return "";
              //   }
              //   return null;
              // },
              decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              // onSaved: (newValue) => password = newValue,
              // onChanged: (value) {
              //   if (value.isNotEmpty) {
              //     removeError(error: kPassNullError);
              //   } else if (value.length >= 8) {
              //     removeError(error: kShortPassError);
              //   }
              //   return;
              // },
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     addError(error: kPassNullError);
              //     return "";
              //   } else if (value.length < 8) {
              //     addError(error: kShortPassError);
              //     return "";
              //   }
              //   return null;
              // },
              decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_keyform.currentState!.validate()) {
                  _keyform.currentState!.save();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    InitialScreen.routeName,
                    (route) => true,
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ));
  }
}
