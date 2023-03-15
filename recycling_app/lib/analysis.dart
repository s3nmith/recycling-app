import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(analysis());
}

class analysis extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trash Recognition',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
