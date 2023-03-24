import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:recycling_app/about/aboutpage.dart';

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

  void signUserIn(String message) async {
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
    //await FirebaseAuth.instance.signInWithEmailAndPassword(
    //email: emailController.text,
    //password: passwordController.text,
    //);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 932;
    double width = MediaQuery.of(context).size.width / 430;

    return Consumer<AuthService>(
      builder: (context, authService, child) {
        final user = authService.currentUser();
        return Scaffold(
          appBar: AppBar(
            title: Text("Gaijin-Recycling"),
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
                    height: 230,
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
                SizedBox(height: height * 32),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: "Email"),
                ),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                ),

                SizedBox(height: height * 20),

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
                        signUserIn("SignIn Successful");
                      },
                      onError: (err) {
                        signUserIn(err);
                      },
                    );
                  },
                ),
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text("Sign Up",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  onPressed: () {
                    authService.signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        onSuccess: () {
                          signUserIn("SignUp Successful");
                        },
                        onError: (err) {
                          signUserIn(err);
                        });
                  },
                ),

                /// signup

                SizedBox(
                  height: height * 15,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
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

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 115,
                  ),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    icon: Image.asset(
                      "assets/images/logos/google.png",
                      height: 25,
                      width: 25,
                    ),
                    label: Text(" Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                    onPressed: () {
                      Google().signInWithGoogle();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
