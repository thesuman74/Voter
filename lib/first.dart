import 'package:flutter/material.dart';
import 'package:voter/second.dart';

class FirstPage extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(labelText: 'Enter a value'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second page and pass the value
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(
                        passedValue: textController.text,
                      ),
                    ),
                  );
                },
                child: const Text('Go to test Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
