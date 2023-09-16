// ignore_for_file: avoid_print

import 'dart:convert';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voter/view_data.dart';

class Myform extends StatefulWidget {
  const Myform({super.key});

  @override
  State<Myform> createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  //to use value from  textfield

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertrecord() async {
    if (name.text != "" || email.text != "" || password.text != "") {
      try {
        String uri = "http://10.0.2.2/practice_api/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "email": email.text,
          "password": password.text,
        });
//getting response from json
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("record inserted successfully");
          name.text = "";
          email.text = "";
          password.text = "";
        } else {
          print("some issues while inserting ");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please fill all fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Form Page"),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Enter name")),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: TextFormField(
                controller: email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Enter Email")),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: TextFormField(
                controller: password,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Password")),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  insertrecord();
                },
                child: const Text("Insert"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const view_data()));
                },
                child: const Text("view data"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
