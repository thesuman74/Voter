import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voter/view_data.dart';
import 'package:voter/formpage.dart';

class update_record extends StatefulWidget {
  String name;
  String email;
  String password;

  update_record(this.name, this.email, this.password, {super.key});

  @override
  State<update_record> createState() => _update_recordState();
}

class _update_recordState extends State<update_record> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> updaterecord() async {
    try {
      String uri = "http://10.0.2.2/practice_api/update_data.php";
      var res = await http.post(Uri.parse(uri), body: {
        "name": name.text,
        "email": email.text,
        "password": password.text
      });
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("update successfully");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Myform(), // Replace with the actual name of your FormPage widget
          ),
        );
      } else {
        print("error while updating: ${response['message']}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    //retrive the data to be updated
    name.text = widget.name;
    email.text = widget.email;
    password.text = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("update record"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: TextFormField(
              controller: name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Update name")),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("update email")),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: TextFormField(
              controller: password,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("update Password")),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                updaterecord();
              },
              child: const Text("Update"),
            ),
          ),
        ],
      ),
    );
  }
}
