import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voter/formpage.dart';

import 'create_poll.dart';

class view_poll_data extends StatefulWidget {
  @override
  State<view_poll_data> createState() => _view_poll_dataState();
}

class _view_poll_dataState extends State<view_poll_data> {
  List polldata = [];
  bool isLoading = true; // Track whether data is loading

  Future<void> getrecord() async {
    String uri = "http://192.168.1.65/practice_api/view_poll.php";
    try {
      var response = await http.get(Uri.parse(uri));

      setState(() {
        polldata = jsonDecode(response.body);
        isLoading = false; // Data loading complete
      });
    } catch (e) {
      print(e);
      isLoading = false; // Data loading failed
    }
  }

  @override
  void initState() {
    super.initState();
    getrecord(); // Fetch data when the widget is created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("view poll data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            if (isLoading)
              const Center(
                  child:
                      CircularProgressIndicator()), // Display loading indicator
            if (!isLoading)
              Expanded(
                child: ListView.builder(
                  itemCount: polldata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Myform(
                                    passedValue: polldata[index]["poll_name"],
                                  ),
                                ),
                              );
                            },
                            title: Text(polldata[index]["poll_name"]),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PollPage(), // Replace with the actual name of your "createpoll" page
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
