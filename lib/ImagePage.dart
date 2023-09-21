// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
// Add this import for Size class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class ImageInsert extends StatefulWidget {
  const ImageInsert({Key? key}) : super(key: key);

  @override
  _ImageInsertState createState() => _ImageInsertState();
}

class _ImageInsertState extends State<ImageInsert> {
  TextEditingController caption = TextEditingController();
  File? imagepath;
  String? imagename;
  String? imagedata;
  ImagePicker imagePicker = ImagePicker();
  final double maxWidth = 300.0; // Define maximum image width
  final double maxHeight = 300.0; // Define maximum image height

  Future<void> uploadimage() async {
    try {
      String uri = "http://10.0.2.2/practice_api/imageupload.php";
      var res = await http.post(Uri.parse(uri), body: {
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

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagepath = File(getimage!.path);
      imagename = getimage.path.split('/').last;
      imagedata = base64Encode(imagepath!.readAsBytesSync());
      print("Caption: ${caption.text}");
      print("ImageData: $imagedata");
      print("ImageName: $imagename");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image page"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
            controller: caption,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter caption for image",
            ),
          ),
          const SizedBox(height: 20),
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
              : Text('Image not chosen yet'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              getImage();
            },
            child: const Text("Choose Image"),
          ),
          ElevatedButton(
            onPressed: () {
              if (imagepath != null) {
                uploadimage();
              } else {
                print('Please choose an image first');
              }
            },
            child: const Text("Upload"),
          ),
        ],
      ),
    );
  }
}
