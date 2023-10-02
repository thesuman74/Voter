import 'package:flutter/material.dart';
import 'package:voter/create_poll.dart';
import 'package:voter/formpage.dart';
import 'package:voter/home.dart';
import 'package:voter/login.dart';
import 'package:voter/register.dart';
import 'package:voter/success_data.dart';
import 'package:voter/view_poll.dart';
import 'package:voter/voter.dart';
import 'package:voter/user_poll.dart';
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
      initialRoute: 'voter',
      routes: {
        'form': (context) => Myform(),
        'login': (context) => const MyLogin(),
        'counter': (contex) => const MyCounter(),
        'voter': (contex) => const MyVoter(),
        'register': (contex) => const MyRegister(),
        'home': (contex) => const MyCustomWidget(),
        'candidates': (context) => Candidates(),
        'success': (context) => SuccessPage(),
        'adminpoll': (context) => view_poll_data(),
        'createpoll': (context) => PollPage(),
        'userpoll': (context) => user_poll_data(),
      },
    );
  }
}
