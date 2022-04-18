import 'package:analyzer_app/navigation/navigation_wrapper.dart';
import 'package:analyzer_app/auth/auth.dart';
import 'package:analyzer_app/services/services.dart';
import 'package:flutter/material.dart';
import '../main.dart';

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
          return const NavigationWrapper();
        } else {
          return const SingInScreen();
        }
      },
    );
  }
}
