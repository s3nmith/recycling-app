import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class CameraScreen extends StatefulWidget {
  @override
  _Cam createState() => _Cam();
}


class _Cam extends State<CameraScreen> {

  File? image;


  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(image == null) return;

  final imageTemp = File(image.path);
  setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageCam() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
  if(image == null) return;

  final imageTemp = File(image.path);
  setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    //change up the camera aesthetics here

    return Scaffold(
      //customise the app bar here please, it jus looks very default now
      appBar: AppBar(
        title: const Text("Pick Your Trash Picture"),
      ),
      body: Center(
        child: Column(
          children: [
            //i used icon buttons since they're shorter and easy but there is MaterialButton below too (test)
            IconButton(
              icon: Icon(Icons.camera_alt_rounded),
                color: Colors.blueAccent,
                iconSize: 64,
                onPressed: () {
                  pickImageCam();
                }
            ),
            IconButton(
              icon: Icon(Icons.photo_album),
                color: Colors.blueAccent,
                iconSize: 64,
                onPressed: () {
                  pickImage();
                }
            ),

            // MaterialButton(
            //     color: Colors.blue,
            //     child: const Text(
            //         "Pick Image from Camera",
            //         style: TextStyle(
            //             color: Colors.white70, fontWeight: FontWeight.bold
            //         )
            //     ),
            //     onPressed: () {
            //     }
            // ),


            //format the box below to get a size you like 
            SizedBox(height: 10,),
            image != null ? Image.file(image!): Text("No image")
          ],
        ),
      )
    );
  }
}