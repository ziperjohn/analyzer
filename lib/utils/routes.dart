import 'package:analyzer/app.dart';
import 'package:analyzer/screens/sign_up_screen.dart';
import 'package:analyzer/screens/sing_in_screen.dart';

var appRoutes = {
  "/": (context) => App(),
  "/singIn": (context) => SingInScreen(),
  "/singUp": (context) => SingUpScreen(),
};
