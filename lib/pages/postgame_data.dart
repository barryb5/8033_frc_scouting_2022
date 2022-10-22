import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostGameData extends StatefulWidget {
  const PostGameData({Key? key}) : super(key: key);

  @override
  State<PostGameData> createState() => _PostGameDataState();
}

class _PostGameDataState extends State<PostGameData> {
  String dropDownValue = 'Climbing Challenge';
  List<String> items = [
    'Climbing Challenge',
    'Didn\'t Climb',
    'Failed Climb',
    'Bottom Bar',
    'Middle Bar',
    'High Bar',
    'Traverse',
  ];
  bool didDefense = false;
  final notesController = TextEditingController();

  void returnData() async {
    Map<String, dynamic> returnInfo = {
      'challengeResult': dropDownValue,
      'didDefense': didDefense,
      'notes': notesController.text,
    };
    print('Popped post game');
    Navigator.pop((context), returnInfo);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    notesController.dispose();
    super.dispose();
  }

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
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DropdownButton(
                              focusColor: Colors.white,
                              value: dropDownValue,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  if (newValue != items.elementAt(0)) {
                                    dropDownValue = newValue!;
                                    print(newValue);
                                  }
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
                            padding: const EdgeInsets.all(4.0),
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
                                  'Defense',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                              controller: notesController,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Add Notes Here',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Save values and go to next page to generate qr code
                                if (dropDownValue != items.elementAt(0)) {
                                  returnData();
                                } else {
                                  // Tell user to input a climbing challenge status
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        // Retrieve the text that the user has entered by using the
                                        // TextEditingController.
                                        content: Text('Please choose a value from the climbing challenge dropdown'),
                                      );
                                    },
                                  );
                                }
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
