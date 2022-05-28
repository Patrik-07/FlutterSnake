import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

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
      savePlayers();
    });
  }

  void addPlayer(Player player) {
    Leaderboard.addPlayer(player);
  }

  Future<void> readPlayers() async {
    final file = await _localFile;
    file.readAsString().then((String jsonString) {
      List playersJson = jsonDecode(jsonString);
      List<Player> players =
          playersJson.map((item) => Player.fromJson(item)).toList();
      Leaderboard.reset(players);
    });
  }

  Future<File> savePlayers() async {
    String jsonString = "[";

    List<Player> players = Leaderboard.players;
    for (int i = 0; i < players.length; i++) {
      Player player = players[i];
      jsonString += jsonEncode(player);
      if (i != players.length - 1) {
        jsonString += ",";
      }
    }

    jsonString += "]";

    final file = await _localFile;
    print("yooo");
    return file.writeAsString(jsonString);
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
