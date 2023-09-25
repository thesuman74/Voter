import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String? passedValue;

  SecondPage({this.passedValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Value received from First Page:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              passedValue ?? 'No value passed',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
