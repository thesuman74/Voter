import 'package:flutter/material.dart';
import 'package:voter/home.dart';

void main() => runApp(const MaterialApp(home: MyHome()));

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr scanning For web'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
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
              'assets/images/qr-scan.gif',
              width: 280,
              height: 350,
              fit: BoxFit.fitHeight,
            ),
            Center(
              child: FloatingActionButton.extended(
                heroTag: 'unique',
                // Within the SecondScreen widget
                onPressed: () {
                  // Navigate to the second screen using a named route.
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyCustomWidget(),
                  ));
                },
                label: const Text(
                  'Scan Your ID',
                  style: TextStyle(fontSize: 20),
                ),
                // icon: const Icon(Icons.thumb_up),
                backgroundColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
