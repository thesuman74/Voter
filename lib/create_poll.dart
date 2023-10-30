import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'formpage.dart';
// Make sure this import is correct

class PollPage extends StatefulWidget {
  @override
  _PollPageState createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  final TextEditingController poll_name = TextEditingController();

  Future<void> insertrecord() async {
    if (poll_name.text != "") {
      try {
        String uri = "http://192.168.1.65/practice_api//insert_poll.php";
        var res = await http.post(Uri.parse(uri), body: {
          "poll_name": poll_name.text,
        });

        // Getting response from JSON
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("record inserted successfully");
          poll_name.text = "";

          // Navigate to the "Myform" page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Myform(), // Make sure Myform is a valid widget
            ),
          );
        } else {
          print("Some issues while inserting poll name");
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poll Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: TextFormField(
                controller: poll_name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter poll name",
                ),
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
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    poll_name.dispose();
    super.dispose();
  }
}
