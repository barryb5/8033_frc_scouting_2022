import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting/services/point.dart';

import 'event_types.dart';
class Event {

  late EventType type;
  late int timeFromStart;
  late int position;


  Event(this.timeFromStart, this.position, this.type);

  String toString() {
    return 'Time from start: $timeFromStart - Position: $position - Success: $type';
  }

  Event.fromJson(Map<String, dynamic> json);


  Map<String, dynamic> toJson() {
      return {
        'timeSinceInitialEpoch': timeFromStart,
        'type': type,
        'position': position,
      };
    }
}