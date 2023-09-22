import 'package:flutter/material.dart';
import 'data.dart'; // Assuming you have a file named 'data.dart' with your data

class Candidates extends StatefulWidget {
  const Candidates({Key? key});

  @override
  State<Candidates> createState() => _CandidatesState();
}

class _CandidatesState extends State<Candidates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 105, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Welcome Ashish ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    Color? backgroundColor;
                    if (data[index]['color'] != null) {
                      backgroundColor =
                          Color(int.tryParse(data[index]['color']) ?? 0);
                    } else {
                      // If color is null or not a valid int, use a default color.
                      backgroundColor = Colors.grey;
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                Image.network(data[index]['image'] ?? '')
                              ], // Provide a default empty string in case 'image' is null
                            ),
                          ),
                        ),
                        Text(
                          data[index]['name'] ??
                              '', // Provide a default empty string in case 'name' is null
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'success');
                          },
                          child: const Text(
                            'Click Here To Vote',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
