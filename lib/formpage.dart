// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voter/view_data.dart';

import 'dart:io';
// Add this import for Size class
import 'package:image_picker/image_picker.dart';

class Myform extends StatefulWidget {
  const Myform({super.key});

  @override
  State<Myform> createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  //for image
  File? imagepath;
  String? imagename;
  String? imagedata;
  ImagePicker imagePicker = ImagePicker();
  final double maxWidth = 200.0; // Define maximum image width
  final double maxHeight = 200.0; // Define maximum image height

  //to use value from  textfield

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
          "image_name": imagename
        });
//getting response from json
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("record inserted successfully");
          name.text = "";
          email.text = "";
          password.text = "";
          resetImage(); // Call resetImage to clear the image
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

  //function for image uploading
  Future<void> uploadimage() async {
    try {
      String uri = "http://10.0.2.2/practice_api/imageupload.php";
      var res = await http.post(Uri.parse(uri), body: {
        // "caption": caption.text,
        "data": imagedata,
        "name": imagename
      });

      print("Response: ${res.body}"); // Print the response for debugging

      var response = jsonDecode(res.body);

      if (response["success"] == "true") {
        print("uploaded successfully");
      } else {
        print("error while uploading");
      }
    } catch (e) {
      // Handle network-related errors
      print("Network error: $e");
    }
  }

  //function to get image
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
                        fit: BoxFit
                            .contain, // Use BoxFit to fit the image within constraints
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
                        // uploadimage();
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
