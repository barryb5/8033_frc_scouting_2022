import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../services/game_data.dart';

class FRCQrCodeView extends StatefulWidget {
  final bool dataSaved;
  final GameData gameData;
  final List<String> jsonData;

  const FRCQrCodeView(
      {super.key,
      required this.dataSaved,
      required this.gameData,
      required this.jsonData});

  @override
  State<FRCQrCodeView> createState() => _FRCQrCodeViewState(
      dataSaved: this.dataSaved,
      gameData: this.gameData,
      jsonData: this.jsonData);
}

class _FRCQrCodeViewState extends State<FRCQrCodeView> {
  late int pageNumber;
  bool dataSaved;
  GameData gameData;
  List<String> jsonData;

  _FRCQrCodeViewState(
      {required this.dataSaved,
      required this.gameData,
      required this.jsonData});

  @override
  void initState() {
    super.initState();

    pageNumber = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
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
            }),
        SizedBox(
          height: 10,
        ),
        // TODO: Make pagenumber update properly in the page 1 of ?
        Text(
          'Page ${pageNumber + 1} of ${jsonData.length}',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 10,
        ),
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
              minimumSize: Size((MediaQuery.of(context).size.width) / 8,
                  (MediaQuery.of(context).size.height) / 12)),
        ),
        SizedBox(
          height: 10,
        ),
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
              minimumSize: Size((MediaQuery.of(context).size.width) / 8,
                  (MediaQuery.of(context).size.height) / 12)),
        ),
      ],
    );
  }
}
