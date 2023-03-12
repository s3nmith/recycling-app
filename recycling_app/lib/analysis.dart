import 'package:flutter/material.dart';

// ignore: camel_case_types
class analysis extends StatelessWidget {
  const analysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Analysis",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: Column(),
        ));
  }
}
