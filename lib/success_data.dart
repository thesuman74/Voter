import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  final String? imageValue;
  final String? candidateName;

  SuccessPage({this.imageValue, this.candidateName, Key? key})
      : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  bool _showTick = false;

  @override
  void initState() {
    super.initState();
    // Trigger the fade animation after a delay of 2 seconds.
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showTick = true;
      });
      // Auto-navigate to the next page after 5 seconds
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, 'userposll');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Success Page"),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Successful",
              style: TextStyle(
                fontSize: 27,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Center(
            child: Text(
              "Voting is not only our right, it is our power.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250, // Set the width of the Card
                  height: 350, // Set the height of the Card
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Card's border radius
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                16.0), // Image's border radius
                            child: Image.network(
                              widget.imageValue ??
                                  'assets/candidate.jpg', // Use widget.imageValue here
                              width: 350,
                              height: 350,
                              fit: BoxFit.fill, // Fill the entire container
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(seconds: 1),
                            opacity: _showTick ? 1.0 : 0.0,
                            child: Image.asset(
                              'assets/tick.png',
                              width: 180,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              widget.candidateName ?? "", // Use widget.candidateName here
              style: TextStyle(
                fontSize: 27,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, 'voter');
            },
            label: const Text(
              'Thanks for voting',
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
