import 'package:analyzer_app/auth_wrapper.dart';
import 'package:analyzer_app/screens/forgot_password_screen.dart';
import 'package:analyzer_app/screens/sign_up_screen.dart';

var appRoutes = {
  "/": (context) => const AuthWrapper(),
  "/singUp": (context) => const SingUpScreen(),
  "/forgotPassword": (context) => const ForgotPasswordScreen(),
};
