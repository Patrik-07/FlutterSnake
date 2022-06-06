import 'player.dart';

class Leaderboard {
  static List<Player> players = [];

  static void reset(Iterable<Player> newPlayers) {
    players.clear();
    players.addAll(newPlayers);
  }

  static void addPlayer(Player player) {
    List<Player> newPlayers = List.from(players);
    newPlayers.add(player);
    newPlayers.sort((a, b) => a.score.compareTo(b.score));
    final l = newPlayers.reversed;
    reset(l.take(5));
  }
}
