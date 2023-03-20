import 'package:flutter/material.dart';


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

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Closest Trash Can",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logos/logo.png'),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.center,
            child: Text("Under Construction. Please wait a little while :)",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )
        ])
    );
  }
}