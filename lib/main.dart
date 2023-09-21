import 'package:flutter/material.dart';
import 'package:voter/formpage.dart';
import 'package:voter/home.dart';
import 'package:voter/login.dart';
import 'package:voter/register.dart';
import 'package:voter/voter.dart';
import 'candidates.dart';
import 'counter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key? ley});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'form',
      routes: {
        'form': (context) => const Myform(),
        'login': (context) => const MyLogin(),
        'counter': (contex) => const MyCounter(),
        'voter': (contex) => const MyVoter(),
        'register': (contex) => const MyRegister(),
        'home': (contex) => const MyCustomWidget(),
        'candidates': (context) => const Candidates()
      },
    );
  }
}
