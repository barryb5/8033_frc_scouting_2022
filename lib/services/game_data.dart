import 'package:frc_scouting/services/event.dart';
import 'package:intl/intl.dart';
import 'package:frc_scouting/services/events.dart';

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
}