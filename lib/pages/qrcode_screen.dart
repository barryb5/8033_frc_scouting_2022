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

  void generateQRCode(GameData gameData) {
    print(gameData);
    String JSONString = json.encode(gameData);
    print(JSONString);
  }

  @override
  Widget build(BuildContext context) {
    final GameData gameData = ModalRoute.of(context)!.settings.arguments as GameData;
    List<String> jsonData = gameData.manualJson();
    print(jsonData);
    print(jsonData.elementAt(0).length);
    print(jsonData.length);


    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height-35,
                minWidth: MediaQuery.of(context).size.width,
              ),
              child: Column(
                children: [
                  QrImage(
                      data: jsonData.elementAt(0),
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
                  SizedBox(height: 25,),
                  ElevatedButton(
                    onPressed: () {
                      return;
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.black, width: 3),
                        backgroundColor: const Color(0xff491365),
                        minimumSize: Size((MediaQuery.of(context).size.width)/8, (MediaQuery.of(context).size.height)/12)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
