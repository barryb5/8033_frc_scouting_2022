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
      'events': events,
    };
    print('Popped data entry');
    Navigator.pop((context), returnInfo);
  }

  List<Event> events = [];

  void startCountdown() {
    print('Countdown starting');
    Future.delayed(Duration(seconds: 155), () {
      // TODO: Create and go to end screen
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
    double addEventButtonHeight = (MediaQuery.of(context).size.height) * 0.378472222222;
    double topSizedBoxHeight = (MediaQuery.of(context).size.height) * 0.0364583333333;
    double bottomSizedBoxHeight = (MediaQuery.of(context).size.height) * 0.0203055555556;
    double missedButtonHeight = (MediaQuery.of(context).size.height) * 0.0972222222222;

    // print('Button Height $addEventButtonWidth');

    return Scaffold(
      // 35 Pixels go to safe area aka 0.0850694444444 of the height
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gameboard_cropped.png'),
                alignment: Alignment.topCenter
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: topSizedBoxHeight),
              ButtonBar(
                buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // TODO: Custom clipper path for each shape
                  ElevatedButton(
                    onPressed: () {
                      events.add(Event(DateTime.now().difference(startTime).inMilliseconds, 1, EventType.shotSuccess));
                      print(events.toString());
                    },
                    child: Text(
                      'Add Event',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: Colors.redAccent.withOpacity(.5),
                        minimumSize: Size(addEventButtonWidth, addEventButtonHeight)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      events.add(Event(DateTime.now().difference(startTime).inMilliseconds, 2, EventType.shotSuccess));
                      print(events.toString());
                    },
                    child: Text(
                      'Add Event',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: Colors.redAccent.withOpacity(.5),
                        minimumSize: Size(addEventButtonWidth, addEventButtonHeight)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      events.add(Event(DateTime.now().difference(startTime).inMilliseconds, 3, EventType.shotSuccess));
                      print(events.toString());
                    },
                    child: Text(
                      'Add Event',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: Colors.redAccent.withOpacity(.5),
                        minimumSize: Size(addEventButtonWidth, addEventButtonHeight)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      events.add(Event(DateTime.now().difference(startTime).inMilliseconds, 4, EventType.shotSuccess));
                      print(events.toString());
                    },
                    child: Text(
                      'Add Event',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: Colors.redAccent.withOpacity(.5),
                        minimumSize: Size(addEventButtonWidth, addEventButtonHeight)
                    ),
                  ),
                ],
              ),
              ButtonBar(
                buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // TODO: Custom clipper path for each shape
                  ElevatedButton(
                    onPressed: () {
                      events.add(Event(DateTime.now().difference(startTime).inMilliseconds, 5, EventType.shotSuccess));
                      print(events.toString());
                    },
                    child: Text(
                      'Add Event',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: Colors.redAccent.withOpacity(.5),
                        minimumSize: Size(addEventButtonWidth, addEventButtonHeight)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      events.add(Event(DateTime.now().difference(startTime).inMilliseconds, 6, EventType.shotSuccess));
                      print(events.toString());
                    },
                    child: Text(
                      'Add Event',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: Colors.redAccent.withOpacity(.5),
                        minimumSize: Size(addEventButtonWidth, addEventButtonHeight)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      events.add(Event(DateTime.now().difference(startTime).inMilliseconds, 7, EventType.shotSuccess));
                      print(events.toString());
                    },
                    child: Text(
                      'Add Event',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: Colors.redAccent.withOpacity(.5),
                        minimumSize: Size(addEventButtonWidth, addEventButtonHeight)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      events.add(Event(DateTime.now().difference(startTime).inMilliseconds, 8, EventType.shotSuccess));
                      print(events.toString());
                    },
                    child: Text(
                      'Add Event',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: Colors.redAccent.withOpacity(.5),
                        minimumSize: Size(addEventButtonWidth, addEventButtonHeight)
                    ),
                  ),
                ],
              ),
              SizedBox(height: bottomSizedBoxHeight),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonPadding: EdgeInsets.zero,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Swap brokeDown
                      setState(() {
                        brokeDown = brokeDown ? false : true;
                        events.add(Event(DateTime.now().difference(startTime).inMilliseconds, 0, (brokeDown ? EventType.robotBecomesImmobile : EventType.robotBecomesMobile)));
                        print('Broken State: ${events[events.length - 1].type}');
                        print('Broke Down: $brokeDown');
                      });
                    },
                    child: Text(
                      'Robot Broke: $brokeDown',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: brokeDown ? Colors.red.withOpacity(.5) : Colors.green.withOpacity(.5),
                        // Calculated with high precision so it doesn't accidentally go offscreen
                        minimumSize: Size(addEventButtonWidth, missedButtonHeight)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Event temp = events[events.length - 1];
                      events[events.length - 1] = Event(temp.timeFromStart, temp.position, EventType.shotMiss);
                      print(events.toString());
                    },
                    child: Text(
                      'Make Missed',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: Colors.grey.withOpacity(.5),
                        minimumSize: Size(addEventButtonWidth, missedButtonHeight)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed((context), '/postgame_data_entry');
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 3),
                      backgroundColor: const Color(0xff491365),
                      minimumSize: Size(addEventButtonWidth, missedButtonHeight)
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
