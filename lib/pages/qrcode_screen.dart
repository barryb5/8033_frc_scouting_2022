import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting/services/game_data.dart';
import 'dart:convert';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;
import 'dart:io';


class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {

  late int pageNumber;
  late String JSONString;
  late GameData gameData;
  late List<String> jsonData;
  final GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    pageNumber = 0;
  }

  @override
  Widget build(BuildContext context) {
    gameData = ModalRoute.of(context)!.settings.arguments as GameData;
    jsonData = gameData.manualJson();

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
                  for (int i = 0; i < jsonData.length; i++) {
                  //   _capture(i);
                    File qrcodeFile = File('saved_gamedata/${gameData.uuid.toString()}_$i.json');
                    qrcodeFile.writeAsString('${jsonData.elementAt(i)}');
                  }

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

  Future<void> _capture(int pageNum) async {

    final RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage();
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData?.buffer.asUint8List();

    final qrcodeFile = File('saved_qr/${gameData.uuid}_$pageNum.png');
    qrcodeFile.writeAsBytes(bytes!);

    // do stuff with your file qrcodeFile.path()...
  }
}
