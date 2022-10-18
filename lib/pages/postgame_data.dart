import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostGameData extends StatefulWidget {
  const PostGameData({Key? key}) : super(key: key);

  @override
  State<PostGameData> createState() => _PostGameDataState();
}

class _PostGameDataState extends State<PostGameData> {
  String dropDownValue = 'Didn\'t Climb';
  List<String> items = [
    'Didn\'t Climb',
    'Bottom Bar',
    'Middle Bar',
    'High Bar',
    'Traverse',
  ];
  bool didDefense = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
        backgroundColor: const Color(0xff491365),
        body: SafeArea(
            child: Container(
              // color: Colors.green,
              width: (MediaQuery.of(context).size.width),
              height: (MediaQuery.of(context).size.height),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/logo.png',
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Climbing Challenge',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              focusColor: Colors.white,
                              value: dropDownValue,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownValue = newValue!;
                                });
                              },
                              items: items.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: didDefense,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      didDefense = value!;
                                      print('Did defense: $didDefense');
                                    });
                                  }
                                ),
                                Text(
                                  'Did Defense',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Save values and go to next page to generate qr code
                              },
                              child: Text(
                                'Finished',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff491365),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
    );
  }
}
