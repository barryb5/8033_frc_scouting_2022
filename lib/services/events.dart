import 'dart:math';

import 'package:frc_scouting/services/event.dart';

class Events {

  late Map<String, dynamic> events;
  late List<Event> eventsAsList;


  Events(List<Event> events) {
    eventsAsList = events;
    // Has to increase by 1 first then apply key number otherwise it breaks
    int i = -1;
    this.events = Map.fromIterable(events, key: (e) {
      i++;
      return i.toString();
    }, value: (e) => e);
  }

  // String toString() {
  //   return 'Time from start: $timeFromStart - Position: $position - Success: $type';
  // }

  Events.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    return events;
  }

  String manualJson(int page) {
    String returnEvents = '';

    for (int i = page*10; i < (page*10)+10 && i < eventsAsList.length; i++) {
      // print('When: $returnEvents');
      returnEvents = returnEvents + '{"timeSince":"${eventsAsList.elementAt(i).timeFromStart}","type":"${eventsAsList.elementAt(i).type}","pos":"${eventsAsList.elementAt(i).position}"},';
    }
    // TODO: returnEvents is getting cut off randomly for some reason
    // Removes comma at the end
    // print('Original: $returnEvents');
    returnEvents = returnEvents.substring(0, returnEvents.length-1);
    // print('New: $returnEvents');
    return returnEvents;
  }
}