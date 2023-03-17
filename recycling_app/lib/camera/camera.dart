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
              image != null
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, bottom: 15, left: 8.0, right: 8.0),
                          child: Image.file(image!),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 60, bottom: 10.0),
                              child: SizedBox(
                                height: 55,
                                width: 380,
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.analytics_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  label: const Text('  Analyze',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      primary: Colors.blue,
                                      onPrimary: Colors.white,
                                      textStyle: const TextStyle(fontSize: 18)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => analysis()),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 55,
                                  width: 380,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    label: const Text('  Retake',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500)),
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.only(right: 50),
                                        primary: Colors.green,
                                        onPrimary: Colors.white,
                                        //shadowColor: Colors.blue,
                                        //elevation: 2,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        textStyle:
                                            const TextStyle(fontSize: 18)),
                                    onPressed: () {
                                      pickImageCam();
                                    },
                                  ),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  height: 55,
                                  width: 380,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.photo_album_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    label: const Text(
                                      '  Rechoose from Gallery',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.only(right: 37),
                                        primary: Colors.orange,
                                        onPrimary: Colors.white,
                                        //shadowColor: Colors.blue,
                                        //elevation: 2,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        textStyle:
                                            const TextStyle(fontSize: 18)),
                                    onPressed: () {
                                      pickImage();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  : Visibility(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                                height: 175,
                                child: Image.asset(
                                    height: 175, 'assets/images/ume.png')),
                          ),
                          SizedBox(height: 62),
                          SizedBox(
                            height: 55,
                            width: 380,
                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                              label: const Text('       Take with Camera',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(right: 50),
                                  primary: Colors.green,
                                  onPrimary: Colors.white,
                                  //shadowColor: Colors.blue,
                                  //elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  textStyle: const TextStyle(fontSize: 18)),
                              onPressed: () {
                                pickImageCam();
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 55,
                            width: 380,
                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.photo_album_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                              label: const Text('     Choose from Gallery',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(right: 37),
                                  primary: Colors.orange,
                                  onPrimary: Colors.white,
                                  //shadowColor: Colors.blue,
                                  //elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  textStyle: const TextStyle(fontSize: 18)),
                              onPressed: () {
                                pickImage();
                              },
                            ),
                          ),
                          SizedBox(height: 155),
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              height: 130,
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ));
  }
}
