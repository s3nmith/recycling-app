import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import '../map/map.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:unorm_dart/unorm_dart.dart' as unorm;

class CameraScreen extends StatefulWidget {
  final String category;
  const CameraScreen({required this.category});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CameraScreen> {
  File _image = File('');
  List<dynamic>? _output;
  String _data = '';
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
    //dispose function disposes and clears the memory
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
        _getData();
      });
    });
  }

  Future<String> getData(String ward, String trashType) async {
    final csvString =
        await rootBundle.loadString('assets/trash_categories.csv');
    final csvData = CsvToListConverter().convert(csvString);

    // Find the column index for the provided ward
    final wardIndex = csvData[0].indexOf(ward);

    // Find the row with the provided trash type
    final trashRow = csvData.firstWhere((row) => row[0] == trashType);

    // Get the data for the ward and trash type
    final data = trashRow[wardIndex];

    return data;
  }

  Future<void> _getData() async {
    dynamic element = _output?[0]['label'];
    String stringElement = element.toString();
    String normalizedString = unorm.nfc(
        stringElement); // Normalize string to make sure Japanese text have same encoding
    final data = await getData(widget.category, normalizedString);
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    //change up the camera aesthetics here
    //iPhone 14 Pro Max Viewport Size: 430px × 932px. Reason behind why the height and width is formatted the way it is.
    double height = MediaQuery.of(context).size.height / 932;
    double width = MediaQuery.of(context).size.width / 430;

    return Scaffold(
        //customise the app bar
        appBar: AppBar(
          title: const Text(
            "Analysis Screen",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.map,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapPage()));
                })
          ],
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  modelRun == true
                      ? Column(children: [
                          _output == null
                              ? Column(
                                  children: [
                                    Text('Waiting for classification.'),
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(height: height * 25),
                                    Text(
                                      'The trash type is:',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: height * 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: height * 10),
                                    Text(
                                      '${_output?[0]['label'] ?? ''}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: height * 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: height * 10),
                                    Text(
                                        'Trash category in ${widget.category} is ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: height * 16,
                                            color: Colors.black)),
                                    SizedBox(height: height * 10),
                                    Text(_data,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: height * 18,
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold)),
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
              ),
              Column(
                children: [
                  imagePicked == false
                      ? Column(children: [
                          SizedBox(height: height * 230),
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                                height: height * 175,
                                child: Image.asset(
                                    'assets/images/decorations/ume.png')),
                          ),
                          Text(
                            'Please select an image to proceed.',
                            style: TextStyle(
                              fontSize: height * 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: height * 10)
                        ])
                      : Column(
                          children: [
                            SizedBox(height: height * 15),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 0,
                                  bottom: height * 5,
                                  left: width * 8,
                                  right: width * 8),
                              child: Image.file(
                                _image,
                                height: height * 428,
                                width: width * 321,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height * 10, bottom: height * 10),
                              child: SizedBox(
                                height: height * 55,
                                width: width * 380,
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.analytics_outlined,
                                    color: Colors.white,
                                    size: height * 40,
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
                                          TextStyle(fontSize: height * 18),
                                      padding:
                                          EdgeInsets.only(right: width * 100)),
                                  onPressed: () {
                                    analyzing = true;
                                    classifyButtonPressed();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                  Column(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 55,
                          width: width * 380,
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: height * 40,
                            ),
                            label: Text('           Take Picture',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.only(right: width * 81),
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                //shadowColor: Colors.blue,
                                //elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                textStyle: TextStyle(fontSize: height * 18)),
                            onPressed: () {
                              pickImage(ImageSource.camera);
                            },
                          ),
                        ),
                        SizedBox(height: height * 10),
                        SizedBox(
                          height: height * 55,
                          width: width * 380,
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.photo_album_outlined,
                              color: Colors.white,
                              size: height * 40,
                            ),
                            label: const Text(
                              '      Select from Gallery',
                              style: TextStyle(fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.only(right: width * 47),
                                primary: Colors.orange,
                                onPrimary: Colors.white,
                                //shadowColor: Colors.blue,
                                //elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                textStyle: TextStyle(fontSize: height * 18)),
                            onPressed: () {
                              pickImage(ImageSource.gallery);
                            },
                          ),
                        ),
                      ],
                    ),
                  ])
                ],
              )
            ],
          ),
        ));
  }
}
