// result_page.dart

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String response;

  ResultPage({required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page'),
      ),
      body: Center(
        child: Text('Response: $response'),
      ),
    );
  }
}
