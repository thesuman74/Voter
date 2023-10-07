// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:voter/user_poll.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({Key? key}) : super(key: key);

  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  List Voterdata = [];
  Future<void> getrecord() async {
    String uri = "http://192.168.1.65/practice_api/check_voters.php";

    try {
      var response = await http.get(Uri.parse(uri));

      setState(() {
        Voterdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getrecord(); // Fetch data when the widget is created
  }

  var getResult = 'QR Code Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('QR Scanner'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              Image.asset(
                'assets/qr-scan.gif',
                width: 280,
                height: 350,
                fit: BoxFit.fitHeight,
              ),
              FloatingActionButton.extended(
                onPressed: () async {
                  final result = await scanQRCode();
                  if (result != null) {
                    // Check if the name is present in Voterdata
                    if (isNameInVoterdata(result)) {
                      // Show a dialog for "Already Voted"
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Already Voted'),
                            content: const Text(
                                'You have already voted. You cannot vote again.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Navigate to user_poll_data with the result
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => user_poll_data(result: result),
                        ),
                      );
                    }
                  }
                },
                label: const Text(
                  'Scan Your ID',
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.orange,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                getResult.split(',').join('\n'),
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return null;

      setState(() {
        getResult = qrCode;
      });

      return qrCode;
    } on PlatformException {
      setState(() {
        getResult = 'Failed to scan QR Code.';
      });

      return null;
    }
  }

  bool isNameInVoterdata(String nameToCheck) {
    // Iterate through Voterdata to check if the name is present
    for (var voter in Voterdata) {
      if (voter["name"] == nameToCheck) {
        return true;
      }
    }
    return false;
  }
}
