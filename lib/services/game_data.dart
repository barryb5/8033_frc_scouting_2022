import 'package:frc_scouting/services/event.dart';
import 'package:intl/intl.dart';
import 'package:frc_scouting/services/events.dart';
import 'package:uuid/uuid.dart';

class GameData {

  late String uuid;
  late int matchNumber;
  late int teamNumber;
  late String scouterName;
  late DateTime startTime;
  late Events events;
  late String challenge;
  late bool defense;
  late String notes;

  GameData(this.matchNumber, this.teamNumber, this.scouterName, this.startTime, this.events, this.challenge, this.defense, this.notes){
    Uuid getuuid = Uuid();
    uuid = getuuid.v4();
  }

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
    List<String> returnJson = [];
    int totalPages = (events.events.length/10).ceil() + 1;

    returnJson.add('{"header":{"UUID":"${uuid.toString()}","eventNumber":"0","matchNumber":"$matchNumber","teamNumber":"$teamNumber","scouterName":"$scouterName","pageNumber":"${1}","totalPages":"$totalPages","startTime":"$startTime"},"meta":{"challenge": "$challenge", "defense": "$defense", "notes": "$notes"}}');

    for (int i = 1; i < totalPages; i++) {
      // Did this ^ just so pagenumbers and totalpages make more sense when being looked at and so first page is reserved for metadata
      returnJson.add('{"header":{"UUID":"${uuid.toString()}","eventNumber":"0","matchNumber":"$matchNumber","teamNumber":"$teamNumber","scouterName":"$scouterName","pageNumber":"${i+1}","totalPages":"$totalPages","startTime":"$startTime"},"events":{"event":[${events.manualJson(i-1)}]}}');
    }

    return returnJson;
  }
}