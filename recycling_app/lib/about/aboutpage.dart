import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:recycling_app/wards/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../sign-in/auth_service.dart';
import '../wards/homepage.dart';
import '../main.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //test by replacing 'Login()' with 'HomePage()' --> there's one more at the end
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Gaijin-Recycling",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(202, 118, 52, 216),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Image.asset('assets/images/logos/logo.png'),
            ),
            SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(text: "An overview of this app", 
                          style: TextStyle(color: Colors.blueAccent, fontSize: 24, fontWeight: FontWeight.bold,))),
            Padding(
              padding: EdgeInsets.only(left: 6, right: 6, top: 25),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: '''  This is team Tokyo Recyclers' project for the Solution Challenge 2023. This app is a tool which foreigners can use inorder to sort their trash in accordance with the rules of each ward in Tokyo.\n
    In this app, the user can take or upload a picture of a piece of garbage with an uncertain disposal category. Our AI will then analyze the image and inform the user precisely what cateogory the garbage in question belongs in the area they live.\n
    We believe that this project will help ease the transition into life in Japan for many people from abroad. This is due to the vast amount of students we have seen struggle with garbage sorting during their first months in Japan. This app can also help educate people on the importance of waste sorting and endeavoring to build a sustainable society.''',
                            style: TextStyle(color: Colors.black,fontSize: 18)),
                    TextSpan(text: "\n\n  Some of the SDG's covered in our project:", style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold))]))),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/SDGs/goal11.png', width: 100),
                  Image.asset('assets/images/SDGs/goal12.png', width: 100),
                  Image.asset('assets/images/SDGs/goal13.png', width: 100)])),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/SDGs/goal14.png', width: 100),
                SizedBox(width: 50),
                Image.asset('assets/images/SDGs/goal15.png', width: 100)]),
            SizedBox(height: 15)
          ]
        ),
      ),
    );
  }
}

// from here is temporary

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
