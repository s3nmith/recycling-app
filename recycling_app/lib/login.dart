import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycling_app/aboutpage.dart';

import 'auth_service.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // async
  await Firebase.initializeApp(); // firebase start
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const Login(),
    ),
  );
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = context.read<AuthService>().currentUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user == null ? LoginPage() : App(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    'assets/images/logo.png',
                    height: 200,
                  ),
                ),
                Center(
                  child: Text(
                    user == null ? "Login" : "Welcome ${user.email}! 👋",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 32),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: "email"),
                ),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "password"),
                ),
                SizedBox(height: 32),

                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                  ),
                  child: Text("login",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    authService.signIn(
                      email: emailController.text,
                      password: passwordController.text,
                      onSuccess: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("login successful"),
                        ));

                        // Move to App
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => App(),
                          ),
                        );
                      },
                      onError: (err) {
                        // error
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(err),
                        ));
                      },
                    );
                  },
                ),

                /// signup
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text("signup",
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  onPressed: () {
                    authService.signUp(
                      email: emailController.text,
                      password: passwordController.text,
                      onSuccess: () {
                        // successful
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("signup successful"),
                        ));
                      },
                      onError: (err) {
                        // error
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(err),
                        ));
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
