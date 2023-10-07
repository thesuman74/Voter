import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voter/success_data.dart';

class Candidates extends StatefulWidget {
  String? passedValue;
  String? result;

  Candidates({this.passedValue, this.result, Key? key}) : super(key: key);

  @override
  State<Candidates> createState() => _CandidatesState();
}

class _CandidatesState extends State<Candidates> {
  List userdata = [];
  Future<void> getrecord(String? passedValue) async {
    // Check if passedValue is not null or empty before making the request
    if (passedValue != null && passedValue.isNotEmpty) {
      String uri = "http://192.168.1.65/practice_api/user_poll.php";
      try {
        var res = await http.post(Uri.parse(uri), body: {
          "passedValue": passedValue,
        });

        var response = jsonDecode(res.body);

        setState(() {
          userdata = response;
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Call getrecord with the passedValue from the widget
    getrecord(widget.passedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Candidates"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.result ?? "", // Add this line to display the 'result' text
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (userdata.length / 2).ceil(),
              itemBuilder: (context, index) {
                int startIndex = index * 2;
                int endIndex = startIndex + 2 > userdata.length
                    ? userdata.length
                    : startIndex + 2;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    endIndex - startIndex,
                    (cardIndex) {
                      var user = userdata[startIndex + cardIndex];
                      return Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SuccessPage(
                                          imageValue:
                                              'http://192.168.1.65/practice_api/${user["image_path"]}',
                                          candidateName: '${user["uname"]}',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'http://192.168.1.65/practice_api/${user["image_path"]}',
                                    width: 150,
                                    height: 200,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  '${user["uname"]}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
