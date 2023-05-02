import 'package:flutter/material.dart';

class ImageTest extends StatelessWidget {
  const ImageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Image.asset("voterlogo.png")
          ],
          
        ),
      ),
    );
  }
}