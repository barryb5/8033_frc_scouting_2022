import 'dart:collection';
import 'dart:convert';
import 'package:frc_scouting/services/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting/services/event.dart';
import '../services/event_types.dart';

class DataEntry extends StatefulWidget {
  const DataEntry({Key? key}) : super(key: key);

  @override
  State<DataEntry> createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {
  late DateTime startTime;
  late bool brokeDown;

  void returnData() async {
    Map<String, dynamic> returnInfo = {
      'startTime': startTime,
      'events': Events(events),
    };
    print('Popped data entry');
    Navigator.pop((context), returnInfo);
  }

  List<Event> events = [];

  void startCountdown() {
    print('Countdown starting');
    Future.delayed(Duration(seconds: 155), () {
      print('Gonna move now');
      returnData();
      // Navigator.pushReplacementNamed((context), '/postgame_data_entry');
    });
  }

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now();
    brokeDown = false;
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    // print('Height ${MediaQuery.of(context).size.height}');
    // Doesn't matter as much
    double addEventButtonWidth = (MediaQuery.of(context).size.width - 40) / 4;
    // Meticulously calculated with desmos, the height of each button should be 0.378472222222 * phone height
    double addEventButtonHeight =
        (MediaQuery.of(context).size.height) * 0.378472222222;
    double topSizedBoxHeight =
        (MediaQuery.of(context).size.height) * 0.0364583333333;
    double bottomSizedBoxHeight =
        (MediaQuery.of(context).size.height) * 0.0203055555556;
    double missedButtonHeight =
        (MediaQuery.of(context).size.height) * 0.0972222222222;

    // print('Button Height $addEventButtonWidth');

    InkWell createAddEventButtonWithShotSuccess(int position) {
      return InkWell(
        child: Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.7),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Text(
            "Add Event ${position}",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        onTap: () {
          events.add(Event(DateTime.now().difference(startTime).inMilliseconds,
              position, EventType.shotSuccess));
          print(events.toString());
        },
      );
    }

    var gridView = Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/gameboard_cropped.png'),
              alignment: Alignment.topCenter)),
      child: GridView.count(
        padding: EdgeInsets.all(4.0),
        crossAxisCount: 3,
        shrinkWrap: true,
        childAspectRatio: 1.3,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(6, (index) {
          return Container(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              height: 200,
              child: Center(child: createAddEventButtonWithShotSuccess(index)),
            ),
          );
        }),
      ),
    );

    return Scaffold(
      // 35 Pixels go to safe area aka 0.0850694444444 of the height
      body: SafeArea(
        child: gridView,
      ),
    );
  }
}
