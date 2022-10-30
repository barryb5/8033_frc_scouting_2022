import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../services/game_data.dart';

class FRCQrCodeView extends StatefulWidget {
  final GameData gameData;
  final List<String> jsonData;
  final bool isDataSaved;

  const FRCQrCodeView(
      {super.key,
      required this.gameData,
      required this.jsonData,
      required this.isDataSaved});

  @override
  State<FRCQrCodeView> createState() => _FRCQrCodeViewState(
      gameData: this.gameData,
      jsonData: this.jsonData,
      isDataSaved: this.isDataSaved);
}

class _FRCQrCodeViewState extends State<FRCQrCodeView> {
  late int pageNumber;
  GameData gameData;
  List<String> jsonData;
  bool isDataSaved;

  _FRCQrCodeViewState(
      {required this.gameData,
      required this.jsonData,
      required this.isDataSaved});

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,  
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              nextQrButton(context),
              SizedBox(
                height: 10,
              ),
              doneButton(),
            ],
          ),
        ),

        // TODO: Not scrolling at all
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            qrCodeHeaderRow("Match Number: ", gameData.matchNumber.toString()),
            qrCodeHeaderRow("Team Number: ", gameData.teamNumber.toString()),
            qrCodeHeaderRow(
                "Number of events: ", gameData.events.events.length.toString()),
          ]),
        ),
      ],
    );
  }

  ElevatedButton nextQrButton(BuildContext context) {
    return ElevatedButton(
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
    );
  }

  Widget qrCodeHeaderRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(label,
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).hintColor)),
          ),
          Expanded(
            flex: 4,
            child: Text(value,
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).hintColor)),
          ),
        ],
      ),
    );
  }

  Widget doneButton() {
    return ElevatedButton(
      onPressed: () async {
        // TODO: Save QR codes to folder here, currently just writing
        if (!isDataSaved) {
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
    );
  }
}
