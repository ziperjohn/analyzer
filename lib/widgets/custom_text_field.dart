import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const CustomTextField(
      {Key? key, required this.controller, required this.hintText, required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
