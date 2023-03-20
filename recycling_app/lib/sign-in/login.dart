import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:recycling_app/about/aboutpage.dart';
import 'package:recycling_app/components/square_tile.dart';

import 'auth_service.dart';
import '../wards/homepage.dart';
import 'google_signin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        final user = authService.currentUser();
        return Scaffold(
          appBar: AppBar(
            title: Text("Recycling App"),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Image.asset(
                    'assets/images/logos/logo.png',
                    height: 200,
                  ),
                ),
                Center(
                  child: Text(
                    user == null ? "Welcome!" : "${user.email}! 👋",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 32),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: "Email"),
                ),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                ),

                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                  ),
                  child: Text("Sign In",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    authService.signIn(
                      email: emailController.text,
                      password: passwordController.text,
                      onSuccess: () {
                        showMessage("login successful");

                        // Move to App
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      },
                      onError: (err) {
                        // error
                        showMessage(err);
                      },
                    );
                  },
                ),

                /// signup

                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 115,
                  ),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                    label: Text(" Google",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Google().signInWithGoogle();
                      authService.signIn(
                        email: emailController.text,
                        password: passwordController.text,
                        onSuccess: () {
                          showMessage("login successful");

                          // Move to App
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                        onError: (err) {
                          // error
                          showMessage(err);
                        },
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
