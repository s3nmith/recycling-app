import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  File _image;
  List<dynamic> _output;
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
      numResults: 19, // the amount of categories the neural network can predict
      threshold: 0.1,
      imageMean: 0,
      imageStd: 20,
    );

    // Wait for a short period of time to give the model time to make a prediction
    await Future.delayed(Duration(milliseconds: 500));
    print(output);
    // Check if the output is not null
    if (output != null && output.isNotEmpty) {
      return output;
    } else {
      output = [];
      return output;
    }
  }

  loadModel() async {
    //this function loads the model
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  pickImage() async {
    //this function grabs the image from camera
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image).then((value) {
      setState(() {
        _output = value;
      });
    });
  }

  pickGalleryImage() async {
    //this function grabs the image from gallery
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image).then((value) {
      setState(() {
        _output = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'GDSC App',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w200,
              fontSize: 20,
              letterSpacing: 0.8),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text('No image selected.')
                : Image.file(
                    _image,
                    height: 336,
                    width: 252,
                  ),
            SizedBox(height: 5),
            _output == null
                ? Text('Waiting for classification.')
                : Column(
                    children: [
                      Text(
                        'The trash type is:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${_output[0]['label'] ?? ''}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
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
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickImage,
              child: Text('Take a picture'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickGalleryImage,
              child: Text('Choose from gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
