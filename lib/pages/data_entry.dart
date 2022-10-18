import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting/services/point.dart';

class DataEntry extends StatefulWidget {
  const DataEntry({Key? key}) : super(key: key);

  @override
  State<DataEntry> createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {

  late DateTime startTime;
  List<Point> points = [];

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
    // startCountdown();
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
    double bottomSizedBoxHeight = (MediaQuery.of(context).size.height) * 0.0243055555556;
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
                      points.add(Point(DateTime.now().difference(startTime).inMilliseconds, 1, true));
                      print(points.toString());
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
                      points.add(Point(DateTime.now().difference(startTime).inMilliseconds, 2, true));
                      print(points.toString());
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
                      points.add(Point(DateTime.now().difference(startTime).inMilliseconds, 3, true));
                      print(points.toString());
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
                      points.add(Point(DateTime.now().difference(startTime).inMilliseconds, 4, true));
                      print(points.toString());
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
                      points.add(Point(DateTime.now().difference(startTime).inMilliseconds, 5, true));
                      print(points.toString());
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
                      points.add(Point(DateTime.now().difference(startTime).inMilliseconds, 6, true));
                      print(points.toString());
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
                      points.add(Point(DateTime.now().difference(startTime).inMilliseconds, 7, true));
                      print(points.toString());
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
                      points.add(Point(DateTime.now().difference(startTime).inMilliseconds, 8, true));
                      print(points.toString());
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
                      Point temp = points[points.length - 1];
                      points[points.length - 1] = Point(temp.timeFromStart, temp.position, false);
                      print(points.toString());
                    },
                    child: Text(
                      'Make Missed',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: Colors.grey.withOpacity(.5),
                        // Calculated with high precision so it doesn't accidentally go offscreen
                        minimumSize: Size(addEventButtonWidth, missedButtonHeight)
                    ),
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
