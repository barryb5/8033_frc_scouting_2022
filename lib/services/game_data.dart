import 'package:frc_scouting/services/event.dart';
import 'package:intl/intl.dart';

class GameData {

  int matchNumber;
  int teamNumber;
  String scouterName;
  DateTime startTime;
  List<Event> events;
  String challenge;
  bool defense;
  String notes;

  GameData(this.matchNumber, this.teamNumber, this.scouterName, this.startTime, this.events, this.challenge, this.defense, this.notes);

  String toString() {
    return 'MatchNumber: $matchNumber\nTeamNumber: $teamNumber\nScouterName: $scouterName\nStartTime: ${DateFormat().format(startTime)}\nNotes: $notes';
  }
}