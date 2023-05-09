import 'package:flutter/material.dart';
import 'package:voterapp/counter.dart';
import 'package:voterapp/login.dart';
import 'package:voterapp/register.dart';
import 'package:voterapp/voter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'register',
    routes: {
      'login': (context) => const MyLogin(),
      'counter': (contex) => const MyCounter(),
      'voter': (contex) => const MyVoter(),
      'register': (contex) => const MyRegister(),
    },
  ));
}
