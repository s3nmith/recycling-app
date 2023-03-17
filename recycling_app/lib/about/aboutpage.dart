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
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "An overview of this app?",
            bodyWidget: Text('''This is team Tokyo Recyclers' project for the Solution Challenge 2023. This app is a tool which foreigners can use inorder to sort their trash in accordance with the rules of each ward in Tokyo.
The user can take or upload a picture of a piece of garbage with an uncertain disposal category. Our AI will then analyze the image and inform the user precisely what cateogory the garbage in question belongs in the area they live.
Some of the SDG's covered in our project:
GOAL 11: Sustainable Cities and Communities
GOAL 12: Responsible Consumption and Production
GOAL 14: Life Below Water
GOAL 15: Life on Land
We believe that this project will help ease the transition into life in Japan for many people from abroad. This is due to the vast amount of students we have seen struggle with garbage sorting during their first months in Japan. This app can also help educate people on the importance of waste sorting and endeavoring to build a sustainable society.''',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.black,fontSize: 18)),
            image: Padding(
              padding: EdgeInsets.only(top: 92),
              child: Image.asset('assets/images/logos/logo.png'),
            ),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PageViewModel(
            title: "How to Use",
            body: "???",
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          PageViewModel(
            title: "How to Use",
            body: "???",
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          PageViewModel(
            title: "How to Use",
            body: "???",
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          PageViewModel(
            title: "How to Use",
            body: "???",
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
        next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
        done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
              //test by replacing 'Login()' with 'HomePage()'
            ),
          );
        },
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
