import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voter/candidates.dart';
import 'package:voter/formpage.dart';
import 'package:voter/update_record.dart';
import 'package:voter/home.dart';

class user_poll_data extends StatefulWidget {
  final String? result;

  user_poll_data({this.result});
  @override
  State<user_poll_data> createState() => _user_poll_dataState();
}

class _user_poll_dataState extends State<user_poll_data> {
  List polldata = [];
  final TextEditingController textController = TextEditingController();
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
    // Check if result is not null and not empty before splitting it
    List<String> qrCodeArray = (widget.result ?? '').split(',');
    String name = qrCodeArray.isNotEmpty ? qrCodeArray[0] : '';
    // String age = qrCodeArray[1];
    // String validity = qrCodeArray[2];
    return Scaffold(
      appBar: AppBar(
        title: const Text("view poll data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "Welcome $name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
                ),
              ],
            ),
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
                                  builder: (context) => Candidates(
                                    passedValue: polldata[index]["poll_name"],
                                    result: "$name",
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
    );
  }
}
