import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recycling_app/about/aboutpage.dart';
import 'package:recycling_app/sign-in/login.dart';
import 'package:recycling_app/wards/homepage.dart';
import 'login.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while the authentication state is being checked
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 7,
              ),
            );
          } else if (snapshot.hasData) {
            // The user is logged in, navigate to the home screen
            return Home();
          } else {
            // The user is not logged in, show the login screen
            return LoginPage();
          }
        },
      ),
    );
  }
}
