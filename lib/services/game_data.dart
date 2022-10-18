import 'package:frc_scouting/services/event.dart';

class GameData {

  int matchNumber;
  int teamNumber;
  String scouterName;
  List<Event> events;
  String challenge;
  bool defense;

  GameData(this.matchNumber, this.teamNumber, this.scouterName, this.events, this.challenge, this.defense);

}