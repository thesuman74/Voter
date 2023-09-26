import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voter/view_data.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Myform extends StatefulWidget {
  final String? passedValue;

  Myform({this.passedValue});

  @override
  State<Myform> createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  String? PollValue;
  File? imagepath;
  String? imagename;
  String? imagedata;
  ImagePicker imagePicker = ImagePicker();
  final double maxWidth = 200.0;
  final double maxHeight = 200.0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    PollValue = widget.passedValue;
  }

  void resetImage() {
    setState(() {
      imagepath = null;
      imagename = null;
      imagedata = null;
    });
  }

  Future<void> insertrecord() async {
    if (name.text != "" || email.text != "" || password.text != "") {
      try {
        String uri = "http://10.0.2.2/practice_api/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "email": email.text,
          "password": password.text,
          "data": imagedata,
          "image_name": imagename,
          "PollValue": PollValue
        });

        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("record inserted successfully");
          name.text = "";
          email.text = "";
          password.text = "";
          resetImage();
          print("form cleared  successfully");
        } else {
          print("some issues while inserting ");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please fill all fields");
    }
  }

  Future<void> uploadimage() async {
    try {
      String uri = "http://10.0.2.2/practice_api/imageupload.php";
      var res = await http
          .post(Uri.parse(uri), body: {"data": imagedata, "name": imagename});

      print("Response: ${res.body}");

      var response = jsonDecode(res.body);

      if (response["success"] == "true") {
        print("uploaded successfully");
      } else {
        print("error while uploading");
      }
    } catch (e) {
      print("Network error: $e");
    }
  }

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagepath = File(getimage!.path);
      imagename = getimage.path.split('/').last;
      imagedata = base64Encode(imagepath!.readAsBytesSync());
      print("ImageData: $imagedata");
      print("ImageName: $imagename");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Form Page"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  '$PollValue',
                  style: const TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Enter name")),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Enter Email")),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter Password")),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    getImage();
                  },
                  child: const Text("choose image"),
                ),
              ),
              imagepath != null
                  ? ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: maxWidth,
                        maxHeight: maxHeight,
                      ),
                      child: Image.file(
                        imagepath!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : const Text('Image not chosen yet'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        insertrecord();
                      },
                      child: const Text("Insert"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const view_data()));
                      },
                      child: const Text("view data"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
