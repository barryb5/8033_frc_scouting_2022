import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting/services/point.dart';
// No longer used, using event instead
class Point {

  String success;
  int timeFromStart;
  int position;


  Point(this.timeFromStart, this.position, this.success);

  String toString() {
    return 'Time from start: $timeFromStart - Position: $position - Success: $success';
  }
}