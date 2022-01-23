import 'package:analyzer/app.dart';
import 'package:analyzer/screens/home_screen.dart';
import 'package:analyzer/screens/sing_in_screen.dart';
import 'package:analyzer/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return ErrorScreen(errorMessage: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return SingInScreen();
          }
        });
  }
}
