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

  late double height;
  late double width;


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

    width = (MediaQuery.of(context).size.width-80)/4;
    height = (MediaQuery.of(context).size.height-100)/2;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/gameboard_cropped.png')
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height,
                  width: width,
                  // padding: EdgeInsets.fromLTRB(vertical: 40, horizontal: 10),
                  padding: EdgeInsets.fromLTRB(5, 80, 5, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                    border: Border.all(color: Colors.black)
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        points.add(Point(DateTime.now().difference(startTime).inMilliseconds, 1));
                        print(points.toString());
                        print(points);
                      });
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    color: Colors.black,
                    icon: Icon(Icons.plus_one,),
                    iconSize: 30,
                    splashRadius: 25,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: height, width: width,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
