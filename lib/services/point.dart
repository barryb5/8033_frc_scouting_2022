import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting/services/point.dart';
class Point {

  final String EVENT_ID = "Ball Success";
  int timeFromStart;
  int position;


  Point(this.timeFromStart, this.position);

  String toString() {
    return '$timeFromStart - $position';
  }
}