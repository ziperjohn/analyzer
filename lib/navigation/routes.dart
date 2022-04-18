import 'package:analyzer_app/navigation/auth_wrapper.dart';
import 'package:analyzer_app/auth/auth.dart';

var appRoutes = {
  "/": (context) => const AuthWrapper(),
  "/singUp": (context) => const SingUpScreen(),
  "/forgotPassword": (context) => const ForgotPasswordScreen(),
};
