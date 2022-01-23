import 'package:analyzer/widgets/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signIn(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      showFlushbar(context, error.message.toString());
    }
  }

  Future<void> signUp(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);
    } on FirebaseAuthException catch (error) {
      showFlushbar(context, error.message.toString());
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (error) {
      showFlushbar(context, error.message.toString());
    }
  }

  void passwordValidation(BuildContext context, String email, String password, String confirmPassword) {
    if (password == confirmPassword) {
      signUp(context, email, password);
    } else {
      showFlushbar(context, "The Passwords Don't Match");
    }
  }
}
