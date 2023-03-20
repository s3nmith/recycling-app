import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CameraScreen> {
  File _image = File('');
  List<dynamic>? _output;
  bool imagePicked = false;
  bool analyzing = false;
  bool modelRun = false;
  final picker = ImagePicker(); //allows to pick image from gallery or camera

  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    //dis function disposes and clears the memory
    super.dispose();
    Tflite.close();
  }

  Future<List<dynamic>> classifyImage(File image) async {
    // Run the model on the image
    var output = await Tflite.runModelOnImage(
      path: image.path,
      asynch: true,
      numResults: 24, // the amount of categories the neural network can predict
      threshold: 0.1,
      imageMean: 0,
      imageStd: 20,
    );

    // Wait for a short period of time to give the model time to make a prediction
    await Future.delayed(Duration(milliseconds: 1000));
    print(output);
    // Check if the output is not null
    if (output != null && output.isNotEmpty) {
      modelRun = true;
      return output;
    } else {
      output = [];
      modelRun = true;
      return output;
    }
  }

  loadModel() async {
    //this function loads the model
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile == null) return;
    setState(() {
      _image = File(pickedFile.path);
      imagePicked = true;
    });
  }

  classifyButtonPressed() async {
    // Call classifyImage only when this button is pressed
    classifyImage(_image).then((value) {
      setState(() {
        _output = value;
      });
    });
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
              _image != null
                  ? Column(
                      children: [
                        imagePicked == false
                            ? Column(children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                      height: 175,
                                      child: Image.asset(
                                          'assets/images/decorations/ume.png')),
                                ),
                                Text(
                                  'Please select an image to proceed.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ])
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        left: 8.0,
                                        right: 8.0),
                                    child: Image.file(
                                      _image,
                                      height: 336,
                                      width: 252,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      modelRun == true
                                          ? Column(children: [
                                              _output == null
                                                  ? Text(
                                                      'Waiting for classification.')
                                                  : Column(
                                                      children: [
                                                        Text(
                                                          'The trash type is:',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        Text(
                                                          '${_output?[0]['label'] ?? ''}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        Text(
                                                          'Trash category in "" is ""',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                            ])
                                          : Column(
                                              children: [
                                                analyzing == false
                                                    ? Container()
                                                    : CircularProgressIndicator()
                                              ],
                                            )
                                    ],
                                  )
                                ],
                              ),
                        Column(children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10.0),
                                child: SizedBox(
                                  height: 55,
                                  width: 380,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.analytics_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    label: const Text('               Analyze',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500)),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        primary: Colors.blue,
                                        onPrimary: Colors.white,
                                        textStyle:
                                            const TextStyle(fontSize: 18),
                                        padding: EdgeInsets.only(right: 100)),
                                    onPressed: () {
                                      analyzing = true;
                                      classifyButtonPressed();
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
                                      label: const Text(
                                          '            Take Picture',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.only(right: 75),
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
                                        pickImage(ImageSource.camera);
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
                                        '  Select from Gallery',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.only(right: 39),
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
                                        pickImage(ImageSource.gallery);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ])
                      ],
                    )
                  : Text('Error loading the app.')
            ],
          ),
        ));
  }
}
