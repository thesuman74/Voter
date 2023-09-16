import 'package:flutter/material.dart';
import 'package:voter/formpage.dart';
// import 'package:voter/home.dart';
import 'package:voter/loginpage.dart';
import 'package:voter/ImagePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key? ley});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      home: const ImageInsert(),
    );
  }
}
