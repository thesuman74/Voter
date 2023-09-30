// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voter/update_record.dart';

class view_data extends StatefulWidget {
  const view_data({super.key});

  @override
  State<view_data> createState() => _view_dataState();
}

class _view_dataState extends State<view_data> {
  List userdata = [];

  Future<void> delrecord(String id) async {
    try {
      String uri = "http://192.168.1.70/practice_api/delete_data.php";

      var res = await http.post(Uri.parse(uri), body: {"id": id});
      var response = jsonDecode(res.body);

      if (response["success"] == "true") {
        print("some issues while deleting");
        getrecord();
      } else {
        print("Record deleted successfully");
        getrecord();
      }

      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> getrecord() async {
    String uri = "http://192.168.1.70/practice_api/view_data.php";

    try {
      var response = await http.get(Uri.parse(uri));

      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("view data"),
      ),
      body: ListView.builder(
        itemCount: userdata.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => update_record(
                      userdata[index]["uname"],
                      userdata[index]["uemail"],
                      userdata[index]["upassword"],
                    ),
                  ),
                );
              },
              leading: Image.network(
                'http://10.0.2.2/practice_api/' + userdata[index]["image_path"],
                width: 100, // Set the width as needed
                height: 100, // Set the height as needed
                fit: BoxFit
                    .scaleDown, // Optional: Adjust the image fit as needed
              ),
              title: Text(userdata[index]["uname"]),
              subtitle: Text(userdata[index]['uemail']),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  delrecord(userdata[index]["id"]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
