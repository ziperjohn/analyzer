import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final IconData? icon;
  final bool autoFocus;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.isPassword,
      required this.isEmail,
      required this.autoFocus,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      obscureText: isPassword,
      enableSuggestions: false,
      autocorrect: false,
      autofocus: autoFocus,
      decoration: InputDecoration(
        prefixIcon: icon == null ? null : Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
