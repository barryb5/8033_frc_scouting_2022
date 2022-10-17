import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataEntry extends StatefulWidget {
  const DataEntry({Key? key}) : super(key: key);

  @override
  State<DataEntry> createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {

  late DateTime startTime;
  late int points;


  void startCountdown() {
    Future.delayed(Duration(seconds: 150), () {
      // TODO: Create and go to end screen
      Navigator.pushReplacementNamed((context), '');
    });
  }

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now();
    points = 0;
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor: MaterialStateProperty.all(Colors.white)
                ),
                color: Colors.black,
                icon: Icon(
                  Icons.plus_one,
                  size: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ],
      ),
    );
  }
}
