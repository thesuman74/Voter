import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voter/formpage.dart';
import 'package:voter/update_record.dart';

class view_poll_data extends StatefulWidget {
  @override
  State<view_poll_data> createState() => _view_poll_dataState();
}

class _view_poll_dataState extends State<view_poll_data> {
  List polldata = [];
  final TextEditingController textController = TextEditingController();

  Future<void> getrecord() async {
    String uri = "http://10.0.2.2/practice_api/view_poll.php";
    try {
      var response = await http.get(Uri.parse(uri));

      polldata = jsonDecode(response.body);
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
        title: const Text("view poll data"),
      ),
      body: Column(
        children: [
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
              ));
            },
          )),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to the second page and pass the value
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Myform(
                    passedValue: textController.text,
                  ),
                ),
              );
            },
            child: Text('Go to Second Page'),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: polldata.length,
          //     itemBuilder: (context, index) {
          //       return Card(
          //         margin: const EdgeInsets.all(8),
          //         child: ListTile(
          //             // onTap: () {
          //             //   String pollDataText = polldata[index]["poll_data"] ??
          //             //       "Default Value"; // Replace "Default Value" with an appropriate default value
          //             //   Navigator.push(
          //             //     context,
          //             //     MaterialPageRoute(
          //             //       builder: (context) => Myform(
          //             //         PollName: pollDataText,
          //             //       ),
          //             //     ),
          //             //   );
          //             // },
          //             // leading: Text(polldata[index]["poll_data"]),
          //             ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
