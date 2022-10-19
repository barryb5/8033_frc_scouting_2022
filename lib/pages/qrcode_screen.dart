import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting/services/game_data.dart';

class QRCodeScreen extends StatefulWidget {
  final GameData gameData;
  const QRCodeScreen({Key? key, required this.gameData}) : super(key: key);

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {

  void generateQRCode() {

  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height-35,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/gameboard_cropped.png',
              ),
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
                    minimumSize: Size((MediaQuery.of(context).size.width)/8, (MediaQuery.of(context).size.height)/8)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
