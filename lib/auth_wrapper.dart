import 'package:analyzer_app/screen_wrapper.dart';
import 'package:analyzer_app/screens/sing_in_screen.dart';
import 'package:analyzer_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'main.dart';

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
          return const ScreenWrapper();
        } else {
          return const SingInScreen();
        }
      },
    );
  }
}
