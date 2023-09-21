import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({Key? key}) : super(key: key);

  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextScreen(result: result),
                      ),
                    );
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
}

class NextScreen extends StatelessWidget {
  final String result;

  const NextScreen({Key? key, required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> qrCodeArray = result.split(',');
    String name = qrCodeArray[0];
    String age = qrCodeArray[1];
    String validity = qrCodeArray[2];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Next Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Welcome $name",
                  style: const TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "Please read the details carefully.",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                    "Your QR code details are \n Name = $name \n Age = $age \n validity = $validity"),
              ),
            ],
          ),
        ));
  }
}
