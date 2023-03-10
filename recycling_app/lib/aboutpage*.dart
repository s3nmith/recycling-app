import 'package:flutter/material.dart';

//I just moved the second page here because of clutter on main.dart
//updates to come -->
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO write an about page about our app(in progress)
    return Scaffold(
      appBar: AppBar(
        title: Text("About This App"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            //* "Steps"
            const Align(
              alignment: Alignment(-0.9,-0.9),
              child: Text(
                "Steps",
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, -8)
                    )
                  ],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blueAccent,
                  decorationThickness: 3,
                  fontSize: 36,
                )
              )
            ),
            const SizedBox(height: 30),

            //* 1 and image
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.lightGreenAccent,
              alignment: Alignment.topLeft,
              child: Text( //! Bold the 1
                "1. Search and choose the ward in Tokyo.",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                )
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.lightGreenAccent,
              alignment: Alignment.topLeft,
              child: Image.asset(
                //! Change this image later
                'assets/images/wardsfornow.png',
                height: 400),
            )

            //* explanation about 1
          ]
        )
      )
    );
  }
}