import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting/services/game_data.dart';
import 'dart:convert';
import 'dart:async';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  late int pageNumber;
  late bool dataSaved;
  late GameData gameData;
  late List<String> jsonData;
  final GlobalKey globalKey = GlobalKey();

  void saveData(BuildContext context) async {
    String path = gameData.directory.path;
    print('Path: $path');

    for (int i = 0; i < jsonData.length; i++) {
      var filePath = path + '/${gameData.uuid.toString()}_${i}_cachedqr.txt';

      File file = File(filePath);
      file.writeAsString('${jsonData.elementAt(i)}');
    }

    // TODO: Send api insert here
    var client = new http.Client();
    try {
      // Example sending data, the teamkey and tournament key will coorelate to a specific match, which the data will be entered to
      // await client.post(Uri.parse('http://10.0.0.34:4000/listTeams'),
      //  headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //  },
      //  body: jsonEncode(<String, String>{
      //    'teamKey': 'frc${gameData.teamNumber}',
      //    'tournamentKey': //TODO: Preset tournament key
      //    'data': gameData.getData()
      //   }),
      // );
      var response = await client.get(Uri.parse('http://10.0.0.34:4000/listTeams'));

      if (response.statusCode == 201) {
        print('Its saul goodman');
      }
      print(response.body);
    }
    finally {
      // Send another request to see if data was entered correctly

      client.close();

      Fluttertoast.showToast(
          msg: "Sent Data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );

      // TODO: Toast popup
    }

    print('Saved');
    dataSaved = true;

  }

  @override
  void initState() {
    pageNumber = 0;
    dataSaved = false;
  }

  @override
  Widget build(BuildContext context) {
    gameData = ModalRoute.of(context)!.settings.arguments as GameData;
    jsonData = gameData.manualJson();

    if (!dataSaved) {
      saveData(context);
    }

    print('Page Number: $pageNumber');
    print(jsonData.elementAt(pageNumber).length);
    print(jsonData.length);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            children: [
              SizedBox(height: 10,),
              QrImage(
                  data: jsonData.elementAt(pageNumber),
                  version: QrVersions.auto,
                  errorCorrectionLevel: QrErrorCorrectLevel.L,
                  size: (MediaQuery.of(context).size.width),
                  gapless: false,
                  errorStateBuilder: (cxt, err) {
                    return Container(
                      child: Center(
                        child: Text(
                          "Uh oh! Something went wrong...",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
              ),
              SizedBox(height: 10,),
              // TODO: Make pagenumber update properly in the page 1 of ?
              Text(
                'Page ${pageNumber + 1} of ${jsonData.length}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pageNumber++;
                    pageNumber = pageNumber % jsonData.length;
                  });
                },
                child: Text(
                  'Next QR',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.black, width: 3),
                    backgroundColor: const Color(0xff491365),
                    minimumSize: Size((MediaQuery.of(context).size.width) / 8, (MediaQuery.of(context).size.height) / 12)
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () async {
                  // TODO: Save QR codes to folder here, currently just writing
                  if (!dataSaved) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text that the user has entered by using the
                          // TextEditingController.
                          content: Text('Please wait for files to save'),
                        );
                      },
                    );
                  } else {
                    Navigator.pop((context));
                  }
                },
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.black, width: 3),
                    backgroundColor: const Color(0xff491365),
                    minimumSize: Size((MediaQuery.of(context).size.width) / 8, (MediaQuery.of(context).size.height) / 12)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
