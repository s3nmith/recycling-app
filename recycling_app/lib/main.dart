import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycling_app/about/aboutpage.dart';
import 'package:recycling_app/sign-in/auth_page.dart';

import 'sign-in/auth_service.dart';
import 'wards/homepage.dart';
import 'sign-in/login.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
