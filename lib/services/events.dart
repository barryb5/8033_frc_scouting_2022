import 'package:frc_scouting/services/event.dart';

class Events {

  late Map<String, dynamic> events;


  Events(List<Event> events) {
    this.events = Map.fromIterable(events, key: (e) => e.timeFromStart.toString(), value: (e) => e);
  }

  // String toString() {
  //   return 'Time from start: $timeFromStart - Position: $position - Success: $type';
  // }

  Events.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    return events;
  }
}