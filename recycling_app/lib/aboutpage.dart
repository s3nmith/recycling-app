import 'package:flutter/material.dart';


//I just moved the second page here because of clutter on main.dart
//updates to come -->
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About this app"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("클릭 되었습니다!");
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
    );
  }
}