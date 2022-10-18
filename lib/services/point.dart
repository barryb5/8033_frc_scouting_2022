import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting/services/point.dart';
class Point {

  bool success;
  int timeFromStart;
  int position;


  Point(this.timeFromStart, this.position, this.success);

  String toString() {
    return 'Time from start: $timeFromStart - Position: $position - Success: $success';
  }
}