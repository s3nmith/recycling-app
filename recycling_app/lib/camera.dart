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
        title: const Text("Choose Your Trash Picture"),
      ),
      body: Center(
        child: Column(
          children: [
            //* Take picture button
            ElevatedButton.icon(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
              label: const Text('Take With Camera'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                pickImageCam();
              },
            ),
            //* Pick from gallery button
            ElevatedButton.icon(
              icon: const Icon(
                Icons.photo_album_outlined,
                color: Colors.white,
              ),
              label: const Text('Choose from Gallery'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 195, 138, 24),
                onPrimary: Colors.white,
              ),
              onPressed: () {
                pickImage();
              },
            ),

            //format the box below to get a size you like 
            //! Do we need this? @Lahiru (or is it for debugging?)
            SizedBox(height: 10,),
            image != null ? Image.file(image!): Text("No image")
          ],
        ),
      )
    );
  }
}