import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frc_scouting/services/game_data.dart';
import 'dart:convert';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class TextQRCodeScreen extends StatefulWidget {
  const TextQRCodeScreen({super.key});

  @override
  State<TextQRCodeScreen> createState() => _TextQRCodeScreenState();
}

class _TextQRCodeScreenState extends State<TextQRCodeScreen> {
  late int pageNumber;
  final GlobalKey globalKey = GlobalKey();
  Completer completer = new Completer();
  bool completed = false;
  late List<String> data;
  late Future<List<String>> dataFuture;

  Future<List<String>> getData(List cached_data) async {
    List<String> returnData = [];

    try {
      // var file = File('/data/user/0/com.company.frc_scouting/app_flutter/84c8a2b9-a8e3-4c1e-b9fc-2d37e77e4e91_1.txt');
      // String fileData = await file.readAsString();
      // print('Cached Data: ${fileData}');
      // returnData.add(fileData);

      for (int i = 0; i < cached_data.length; i++) {
        String filePath = cached_data[i].toString();
        print(filePath);
        if (cached_data[i].toString().contains('.txt')) {
          var file = File(filePath);
          String fileData = await file.readAsString();
          print('Cached Data: ${fileData}');
          data.add(fileData);
        }
      }

      return returnData;
    } catch (e) {
      throw 'Error with getting data';
    }
  }

  @override
  void initState() {
    pageNumber = 0;
  }

  @override
  Widget build(BuildContext context) {
    List cached_data = ModalRoute.of(context)!.settings.arguments as List;
    dataFuture = getData(cached_data); // Supposed to be in initstate but needed (context)
    /**
     * Bad practice, supposed to have a future variable in the initstate so it
     * doesn't try to look through the files each time you rebuild
     */
    // cached_data.forEach((element) {
    //   data.add(element.toString());
    // });
    // print('Data length: ${data.length}');



    // print('Page Number: $pageNumber');
    // print(data.elementAt(pageNumber).length);
    // print(data.length);

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

          child: FutureBuilder(
                future: dataFuture,
                builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                  if (snapshot.hasData) {
                    data = snapshot.data!;
                    return Column(
                      children: [
                        SizedBox(height: 10,),
                        QrImage(
                            data: data.elementAt(0),
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
                        Text(
                          'Page ${pageNumber + 1} of ${data.length}',
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
                              pageNumber = pageNumber % data.length;
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
                            Navigator.pop((context));
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
                    );
                  } else {
                    return Scaffold(
                      backgroundColor: Colors.blue[900],
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Loading',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 25,),
                          Center(
                            child: SpinKitFadingCube(
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
          ),
        ),
    );
  }
}
