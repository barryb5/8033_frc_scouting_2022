import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting/services/game_data.dart';
import 'dart:io';
import '../views/frc_qrcode_view.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  late int pageNumber;
  late bool isDataSaved;
  late GameData gameData;
  late List<String> jsonData;
  final GlobalKey globalKey = GlobalKey();

  void saveData() async {
    String path = gameData.directory.path;
    print('Path: $path');

    for (int i = 0; i < jsonData.length; i++) {
      var filePath = path + '/${gameData.uuid.toString()}_$i.txt';

      File file = File(filePath);
      file.writeAsString('${jsonData.elementAt(i)}');
    }

    // TODO: Toast popup
    print('Saved');
    isDataSaved = true;
  }

  @override
  void initState() {
    pageNumber = 0;
    isDataSaved = false;
  }

  @override
  Widget build(BuildContext context) {
    gameData = ModalRoute.of(context)!.settings.arguments as GameData;
    jsonData = gameData.manualJson();
    saveData();

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
          minHeight: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Column(
          children: [
            FRCQrCodeView(
                gameData: gameData,
                jsonData: jsonData,
                isDataSaved: isDataSaved),
          ],
        ),
      ),
    ));
  }
}
