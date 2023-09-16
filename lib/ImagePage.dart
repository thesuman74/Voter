import 'package:flutter/material.dart';
import 'dart:io';

class ImageInsert extends StatefulWidget {
  const ImageInsert({Key? key}) : super(key: key);

  @override
  _ImageInsertState createState() => _ImageInsertState();
}

class _ImageInsertState extends State<ImageInsert> {
  TextEditingController caption =
      TextEditingController(); // Add a TextEditingController
  late String imagePath; // Define a variable to store the image path

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
              labelText:
                  "Enter caption for image", // Use 'labelText' for label text
            ),
          ),
          const SizedBox(height: 20),
          // Display the image if 'imagePath' is not null
          // if (imagePath != null)
          // Image.file(
          //   File(imagePath), // Use 'File' from 'dart:io' to create an image file
          //   width: 200,
          //   height: 200,
          // ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Choose Image"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Upload"),
          ),
        ],
      ),
    );
  }
}
