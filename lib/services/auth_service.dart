import 'package:analyzer_app/widgets/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signIn(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      showFlushbar(context, error.code, true);
    }
  }

  Future<void> signUp(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (error) {
      showFlushbar(context, error.code, true);
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (error) {
      showFlushbar(context, error.code, true);
    }
  }

  Future<void> resetPassword(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showFlushbar(context, "recovery_email_sent", false);
    } on FirebaseAuthException catch (error) {
      showFlushbar(context, error.code, true);
    }
  }

  bool passwordValidation(BuildContext context, String password, String confirmPassword) {
    bool isValid = false;
    if (password == confirmPassword) {
      isValid = true;
    } else {
      showFlushbar(context, "passwords_dont_match", true);
      isValid = false;
    }
    return isValid;
  }

  Future<bool> reauthenticationUser(BuildContext context, String email, String password) async {
    bool isCorrect = false;
    try {
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
        await user!.reauthenticateWithCredential(credential);
        isCorrect = true;
      }
    } on FirebaseAuthException catch (error) {
      showFlushbar(context, error.code, true);
      isCorrect = false;
    }
    return isCorrect;
  }

  Future<void> changePassword(BuildContext context, String newPassword) async {
    try {
      if (user != null) {
        await user!.updatePassword(newPassword);
        await user!.reload();
      }
    } on FirebaseAuthException catch (error) {
      showFlushbar(context, error.code, true);
    }
  }

  Future<void> changeEmail(BuildContext context, String newEmail) async {
    try {
      if (user != null) {
        await user!.updateEmail(newEmail);
        await user!.reload();
      }
    } on FirebaseAuthException catch (error) {
      showFlushbar(context, error.code, true);
    }
  }
}
