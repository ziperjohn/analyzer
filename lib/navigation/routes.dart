import 'package:analyzer_app/navigation/auth_wrapper.dart';
import 'package:analyzer_app/auth/forgot_password_screen.dart';
import 'package:analyzer_app/auth/sign_up_screen.dart';

var appRoutes = {
  "/": (context) => const AuthWrapper(),
  "/singUp": (context) => const SingUpScreen(),
  "/forgotPassword": (context) => const ForgotPasswordScreen(),
};
