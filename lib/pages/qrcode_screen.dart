import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting/services/game_data.dart';
import 'dart:convert';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {

  late int pageNumber;

  void generateQRCode(GameData gameData) {
    print(gameData);
    String JSONString = json.encode(gameData);
    print(JSONString);
  }

  @override
  Widget build(BuildContext context) {
    final GameData gameData = ModalRoute.of(context)!.settings.arguments as GameData;
    List<String> jsonData = gameData.manualJson();
    print('Page Number: $pageNumber');
    print(jsonData.elementAt(pageNumber).length);
    print(jsonData.length);

    pageNumber = 0;


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
                  // TODO: Make page numbers work properly
                  if (pageNumber == jsonData.length-1) {
                    pageNumber = 0;
                  } else {
                    pageNumber++;
                  }
                  setState(() {

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
                onPressed: () {
                  // TODO: Save QR codes to folder here
                  return;
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
