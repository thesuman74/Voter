import 'package:flutter/material.dart';
// import 'package:voter/home.dart';
import 'package:voter/loginpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key? ley});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      home: const LoginPage(),
    );
  }
}
