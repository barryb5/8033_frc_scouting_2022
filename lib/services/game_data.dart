import 'package:frc_scouting/services/event.dart';
import 'package:intl/intl.dart';
import 'package:frc_scouting/services/events.dart';
import 'package:uuid/uuid.dart';

class GameData {

  late int matchNumber;
  late int teamNumber;
  late String scouterName;
  late DateTime startTime;
  late Events events;
  late String challenge;
  late bool defense;
  late String notes;

  GameData(this.matchNumber, this.teamNumber, this.scouterName, this.startTime, this.events, this.challenge, this.defense, this.notes);

  String toString() {
    return 'MatchNumber: $matchNumber'
        '\nTeamNumber: $teamNumber'
        '\nScouterName: $scouterName'
        '\nStartTime: ${DateFormat().format(startTime)}'
        '\nEvents: $events'
        '\nNotes: $notes';
  }

  GameData.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    return {
      'startEpoch': startTime.millisecondsSinceEpoch,
      'matchNumber': matchNumber,
      'teamNumber': teamNumber,
      'scouterName': scouterName,
      'events': events,
      'challenge': challenge,
      'defense': defense,
      'notes': notes,
    };
  }

  List<String> manualJson() {
    var uuid = Uuid();
    List<String> returnJson = [];
    int totalPages = (events.events.length/10).ceil();

    for (int i = 0; i < totalPages; i++) {
      // Did this ^ just so pagenumbers and totalpages make more sense when being looked at
      returnJson.add('{"header":{"UUID":"${uuid.v4()}","eventNumber":"0","matchNumber":"$matchNumber","teamNumber":"$teamNumber","scouterName":"$scouterName","pageNumber":"${i+1}","totalPages":"$totalPages","startTime":"$startTime"},"events":{"event":[${events.manualJson(i)}]}}');
    }

    return returnJson;
  }
}