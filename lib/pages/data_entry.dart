import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataEntry extends StatefulWidget {
  const DataEntry({Key? key}) : super(key: key);

  @override
  State<DataEntry> createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {

  late DateTime startTime;

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
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Text('Data Entry Here'),
    );
  }
}
