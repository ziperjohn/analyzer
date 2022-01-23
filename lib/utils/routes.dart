import 'package:analyzer/app.dart';
import 'package:analyzer/screens/forgot_password_screen.dart';
import 'package:analyzer/screens/sign_up_screen.dart';
import 'package:analyzer/screens/sing_in_screen.dart';

var appRoutes = {
  "/": (context) => const App(),
  "/singIn": (context) => SingInScreen(),
  "/singIn/singUp": (context) => SingUpScreen(),
  "/singIn/forgotPassword": (context) => ForgotPasswordScreen(),
};
