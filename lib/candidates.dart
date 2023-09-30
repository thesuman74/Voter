import 'package:flutter/material.dart';
import 'data.dart'; // Assuming you have a file named 'data.dart' with your data

class Candidates extends StatefulWidget {
  final String? passedValue;
  final String? result;

  Candidates({this.passedValue, this.result});

  @override
  State<Candidates> createState() => _CandidatesState();
}

class _CandidatesState extends State<Candidates> {
  @override
  Widget build(BuildContext context) {
    // Check if passedValue is not null and not empty before splitting it
    List<String> qrCodeArray = (widget.result ?? '').split(',');
    String? polldata = widget.passedValue;
    String name = qrCodeArray.isNotEmpty ? qrCodeArray[0] : '';
    // String age = qrCodeArray[1];
    // String validity = qrCodeArray[2];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome $name",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
                    ),
                    Text(
                      "at $polldata",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
                    ),
                  ],
                ),
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
                    childAspectRatio: 1.0,
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
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'success');
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        12.0), // Adjust the radius as needed
                                    child: Image.network(
                                      data[index]['image'] ??
                                          '', // Replace with your image URL
                                      width: 200, // Set the width of the image
                                      height:
                                          200, // Set the height of the image
                                      fit: BoxFit
                                          .cover, // Set how the image should be fitted within its constraints
                                    ),
                                  ),
                                )
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
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, 'success');
                        //   },
                        //   child: const Text(
                        //     'Click Here To Vote',
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       color: Color.fromARGB(255, 0, 0, 0),
                        //     ),
                        //   ),
                        // ),
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
