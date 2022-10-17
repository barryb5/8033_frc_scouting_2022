import 'package:flutter/material.dart';
import 'package:frc_scouting/pages/home_screen.dart';
import 'package:frc_scouting/pages/loading_screen.dart';
import 'package:frc_scouting/pages/login_screen.dart';

void main() {
  // runApp(MaterialApp(
  //   home: Home(),
  // ));

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/login': (context) => Login()
    },
  ));
}
