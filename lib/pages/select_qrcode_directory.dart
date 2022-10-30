import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../custom_widgets/future_builder_error_view.dart';

class SelectQrCodeDirectory extends StatefulWidget {
  const SelectQrCodeDirectory({super.key});

  @override
  State<SelectQrCodeDirectory> createState() => _SelectQrCodeDirectoryState();
}

class _SelectQrCodeDirectoryState extends State<SelectQrCodeDirectory> {
  late Future<List<String>> dataFuture;

  @override
  void initState() {
    super.initState();

    // dataFuture = getFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // constraints: BoxConstraints(
          //   minHeight: MediaQuery.of(context).size.height -
          //       MediaQuery.of(context).padding.top,
          //   minWidth: MediaQuery.of(context).size.width,
          // ),
          // child: FutureBuilder(
          //   future: dataFuture,
          //   builder:
          //       (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          //     if (snapshot.hasError) {
          //       return FutureBuilderErrorView();
          //     } else if (snapshot.hasData) {
          //       jsonData = snapshot.data!;
          //       // return FRCQrCodeView(gameData: jsonData.elementAt(1), jsonData: jsonData);
          //       return Column(
          //         children: [
          //           SizedBox(
          //             height: 10,
          //           ),
          //           QrImage(
          //               data: jsonData.elementAt(pageNumber),
          //               version: QrVersions.auto,
          //               errorCorrectionLevel: QrErrorCorrectLevel.L,
          //               size: (MediaQuery.of(context).size.width),
          //               gapless: false,
          //               errorStateBuilder: (cxt, err) {
          //                 return Container(
          //                   child: Center(
          //                     child: Text(
          //                       "Uh oh! Something went wrong...",
          //                       textAlign: TextAlign.center,
          //                     ),
          //                   ),
          //                 );
          //               }),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Text(
          //             'Page ${pageNumber + 1} of ${jsonData.length}',
          //             style: TextStyle(
          //               color: Colors.grey,
          //               fontSize: 15,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           ElevatedButton(
          //             onPressed: () {
          //               setState(() {
          //                 pageNumber++;
          //                 pageNumber = pageNumber % jsonData.length;
          //               });
          //             },
          //             child: Text(
          //               'Next QR',
          //               style: TextStyle(fontSize: 20.0, color: Colors.white),
          //             ),
          //             style: ElevatedButton.styleFrom(
          //                 side: BorderSide(color: Colors.black, width: 3),
          //                 backgroundColor: const Color(0xff491365),
          //                 minimumSize: Size(
          //                     (MediaQuery.of(context).size.width) / 8,
          //                     (MediaQuery.of(context).size.height) / 12)),
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           ElevatedButton(
          //             onPressed: () async {
          //               Navigator.pop((context));
          //             },
          //             child: Text(
          //               'Done',
          //               style: TextStyle(fontSize: 20.0, color: Colors.white),
          //             ),
          //             style: ElevatedButton.styleFrom(
          //                 side: BorderSide(color: Colors.black, width: 3),
          //                 backgroundColor: const Color(0xff491365),
          //                 minimumSize: Size(
          //                     (MediaQuery.of(context).size.width) / 8,
          //                     (MediaQuery.of(context).size.height) / 12)),
          //           ),
          //         ],
          //       );
          //     } else {
          //       return Scaffold(
          //         backgroundColor: Colors.blue[900],
          //         body: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(
          //               'Loading',
          //               style: TextStyle(
          //                 fontSize: 30,
          //                 color: Colors.white,
          //               ),
          //             ),
          //             SizedBox(
          //               height: 25,
          //             ),
          //             Center(
          //               child: SpinKitFadingCube(
          //                 color: Colors.white,
          //                 size: 50,
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     }
          //   },
          // ),
        ),
      ),
    );
  }
}
