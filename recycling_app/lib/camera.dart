import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'analysis.dart';

class CameraScreen extends StatefulWidget {
  @override
  _Cam createState() => _Cam();
}

class _Cam extends State<CameraScreen> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageCam() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    //change up the camera aesthetics here

    return Scaffold(
        //customise the app bar here please, it jus looks very default now
        appBar: AppBar(
          title: const Text(
            "Choose Your Trash Picture",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              image != null
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 30, left: 8.0, right: 8.0),
                          child: Image.file(image!),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.analytics_outlined,
                                  color: Colors.white,
                                ),
                                label: const Text('Analyze'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white,
                                ),
                                onPressed: () {
                                  print("analysis");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => analysis()),
                                  );
                                },
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                  label: const Text('Retake'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {
                                    pickImageCam();
                                  },
                                ),
                                ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.photo_album_outlined,
                                    color: Colors.white,
                                  ),
                                  label: const Text('Rechoose from Gallery'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange,
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {
                                    pickImage();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  : Visibility(
                      child: Column(
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                            label: const Text('Take ith Camera'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              onPrimary: Colors.white,
                            ),
                            onPressed: () {
                              pickImageCam();
                            },
                          ),
                          ElevatedButton.icon(
                            icon: const Icon(
                              Icons.photo_album_outlined,
                              color: Colors.white,
                            ),
                            label: const Text('Choose from Gallery'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              onPrimary: Colors.white,
                            ),
                            onPressed: () {
                              pickImage();
                            },
                          ),
                        ],
                      ),
                    ),
              //* Take picture button
              //* Pick from gallery button

              //format the box below to get a size you like
              //! Do we need this? @Lahiru (or is it for debugging?)
            ],
          ),
        ));
  }
}
