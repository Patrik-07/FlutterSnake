import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/leaderboard/leaderboard.dart';
import '../../model/leaderboard/player.dart';

import 'package:universal_html/html.dart' as html;

class LeaderboardController {
  static final LeaderboardController _instance =
      LeaderboardController._privateConstructor();
  static LeaderboardController get instance => _instance;
  late File localFile;

  LeaderboardController._privateConstructor() {
    html.window.onUnload.listen((event) async {
      await savePlayers();
    });
  }

  void addPlayer(Player player) {
    Leaderboard.addPlayer(player);
  }

  Future<void> readPlayers() async {
    final prefs = await SharedPreferences.getInstance();

    List<Player> players = [];
    for (int i = 0; i < 5; i++) {
      List<String>? stringList = prefs.getStringList("player$i");
      if (stringList == null) {
        break;
      }
      Player player = Player.fromStringList(stringList);
      players.add(player);
    }

    Leaderboard.reset(players);
  }

  Future<void> savePlayers() async {
    final prefs = await SharedPreferences.getInstance();

    List<Player> players = Leaderboard.players;
    for (int i = 0; i < players.length; i++) {
      await prefs.setStringList("player$i", players[i].toStringList());
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/players.json');
  }
}
