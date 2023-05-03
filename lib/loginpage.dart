import 'package:flutter/material.dart';
import 'package:voter/home.dart';
// import 'package:voter/secondScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("Login Page"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        "Welcome Voters!",
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Voting is not only our right, it is our power.",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/voterlogo.png',
                          width: 280,
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: FloatingActionButton.extended(
                            // Within the SecondScreen widget
                            onPressed: () {
                              // Navigate to the second screen using a named route.
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const MyCustomWidget())));
                            },
                            label: const Text(
                              'Ready TO Vote',
                              style: TextStyle(fontSize: 20),
                            ),
                            // icon: const Icon(Icons.thumb_up),
                            backgroundColor: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
