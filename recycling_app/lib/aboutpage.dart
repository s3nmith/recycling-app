import 'package:flutter/material.dart';

//I just moved the second page here because of clutter on main.dart
//updates to come -->
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO write an about page about our app
    return Scaffold(
      appBar: AppBar(
        title: Text("About This App"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
    );
  }
}