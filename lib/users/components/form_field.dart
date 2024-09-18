import 'package:flutter/material.dart';

class Format extends StatelessWidget {
  const Format({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText,
    this.suffix,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
            cursorColor: Colors.black,
            onChanged: onChanged,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              suffixIcon: suffix,
              labelText: labelText,
              labelStyle: const TextStyle(color: Colors.black),
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.black),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            controller: controller,
            obscureText: obscureText ?? false,
            validator: validator),
      ],
    );
  }
}
