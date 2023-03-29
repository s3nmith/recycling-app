import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class AuthService extends ChangeNotifier {
  User? currentUser() {
    // Current user(return null if not loged in)
    return FirebaseAuth.instance.currentUser;
  }

  void signUp({
    required String email,
    required String password,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    if (email.isEmpty) {
      onError("Please type id.");
      return;
    } else if (password.isEmpty) {
      onError("Please type pw.");
      return;
    }

    // firebase auth signup
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      onSuccess();
    } on FirebaseAuthException catch (e) {
      // Firebase auth error
      onError(e.message!);
    } catch (e) {
      // Firebase auth (+) error
      onError(e.toString());
    }
  }

  void signIn({
    required String email,
    required String password,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    if (email.isEmpty) {
      onError('Please type id');
      return;
    } else if (password.isEmpty) {
      onError('Please type pw');
      return;
    }

    // login attempt
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      onSuccess();
      notifyListeners(); // login status change notification
    } on FirebaseAuthException catch (e) {
      // firebase auth error
      onError(e.message!);
    } catch (e) {
      // Firebase auth (+) error
      onError(e.toString());
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners(); // login status change notification
  }

  signInWithGoogle() {}
}
