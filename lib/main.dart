import 'package:flutter/material.dart';
import 'package:frc_scouting/pages/data_entry.dart';
import 'package:frc_scouting/pages/home_screen.dart';
import 'package:frc_scouting/pages/loading_screen.dart';
import 'package:frc_scouting/pages/login_screen.dart';
import 'package:frc_scouting/pages/postgame_data.dart';
import 'package:frc_scouting/pages/qrcode_screen.dart';
import 'package:frc_scouting/pages/start_collection.dart';
import 'package:frc_scouting/pages/qrcode_screen.dart';

void main() {
  // runApp(MaterialApp(
  //   home: Home(),
  // ));

  runApp(MaterialApp(
    initialRoute: '/start_page',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/login': (context) => Login(),
      '/data_entry': (context) => DataEntry(),
      '/postgame_data_entry': (context) => PostGameData(),
      '/start_page': (context) => StartPage(),
      // '/qrcode_screen': (context) => QRCodeScreen(),
    },
  ));
}
