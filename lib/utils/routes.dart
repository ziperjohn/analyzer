import 'package:analyzer_app/app.dart';
import 'package:analyzer_app/screens/forgot_password_screen.dart';
import 'package:analyzer_app/screens/sign_up_screen.dart';
import 'package:analyzer_app/screens/sing_in_screen.dart';

var appRoutes = {
  "/": (context) => const App(),
  "/singIn": (context) => SingInScreen(),
  "/singIn/singUp": (context) => SingUpScreen(),
  "/singIn/forgotPassword": (context) => ForgotPasswordScreen(),
};
