import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const TextStyle myTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [],
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        "Voter!",
                        style: TextStyle(
                            fontSize: 50,
                            color: Color.fromARGB(255, 61, 32, 194)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Enter your Phone Number"),
                      style: myTextStyle,
                      validator: ((value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+977]*[0-9]+$').hasMatch(value)) {
                          return "Enter correct Number";
                        } else {
                          return null;
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: "Enter your Email"),
                      style: myTextStyle,
                      validator: ((value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(value)) {
                          return "Enter correct email";
                        } else {
                          return null;
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: "Enter your name"),
                      style: myTextStyle,
                      validator: ((value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return "Enter correct name";
                        } else {
                          return null;
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Center(
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: const Text(
                    //       "Submit",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sign up ",
                          style: myTextStyle,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Form is valid, do something here
                            }
                          },
                          child: const Icon(Icons.arrow_right_alt),
                        )
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
