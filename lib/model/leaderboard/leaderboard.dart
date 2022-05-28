import 'player.dart';

class Leaderboard {
  static List<Player> players = [];

  static void reset(Iterable<Player> newPlayers) {
    players.clear();
    players.addAll(newPlayers);
  }

  static void addPlayer(Player player) {
    List<Player> newPlayers = List.from(players);
    newPlayers.sort((a, b) => a.score.compareTo(b.score));
    reset(newPlayers.take(5));
  }
}
