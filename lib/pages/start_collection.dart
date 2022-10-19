import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  late Map<String, dynamic> matchData;
  late Map<String, dynamic> postMatchData;

  void returnData() async {
    print('Returning data');
    Map<String, dynamic> fullMatchData = {};
    fullMatchData.addAll(matchData);
    fullMatchData.addAll(postMatchData);
    Navigator.pop((context), fullMatchData);
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      backgroundColor: const Color(0xff491365),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width)/8, vertical: (MediaQuery.of(context).size.height)/8),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Press start button when ready',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      matchData = await Navigator.pushNamed((context), '/data_entry') as Map<String, dynamic>;
                      postMatchData = await Navigator.pushNamed((context), '/postgame_data_entry') as Map<String, dynamic>;
                      print('Got here');
                      returnData();
                    },
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3),
                        backgroundColor: const Color(0xff491365),
                        minimumSize: Size((MediaQuery.of(context).size.width)/3, (MediaQuery.of(context).size.height)/3)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
