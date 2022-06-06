import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:snake/controller/controllers/leaderboardController.dart';
import 'package:snake/controller/controllers/mapController.dart';
import 'package:snake/controller/controllers/snakeController.dart';
import 'package:snake/model/leaderboard/leaderboard.dart';
import 'package:snake/model/leaderboard/player.dart';
import 'package:snake/view/game/map/mapView.dart';
import 'package:snake/view/menu/menuView.dart';

import '../view/game/common/tile/tile.dart';

class GameController with ChangeNotifier {
  static final MapController _mapController = MapController();
  final SnakeController _snakeController = SnakeController();
  final LeaderboardController _leaderboardController = LeaderboardController.instance;

  late Timer _timer;
  bool isGameOver = false;

  GameController() {
    _timer = new Timer.periodic(
      const Duration(milliseconds: 125),
      updateGame
    );
  }

  static Tile getTile(int row, int col) {
    return _mapController.getTile(row, col);
  }

  void updateGame(Timer t) {
    isGameOver = !_snakeController.updateSnake();
    if (isGameOver) {
      _timer.cancel();
    }
    MapView.instance.update();
    notifyListeners();
  }

  int _getScore() {
    return _snakeController.getSnakeLength() - 3;
  }

  Widget getBottomWidget(BuildContext context) {
    int score = _getScore();
    final playerController = TextEditingController();
    playerController.clear();

    Container backToMenu = Container(
      child: Column(
        children: [
          const Text(
            "Game is over!",
            style: TextStyle(fontSize: 30),
          ),
          const Text(
            "Try again and get to the leaderboard.",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child:ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuView())
                );
              },
            )
          )
        ],
      )
    );

    if (isGameOver) {
      _snakeController.resetSnake();
      _mapController.reset();
      if (score == 0) {
        return backToMenu;
      } else {
        bool isSave = false;
        if (Leaderboard.players.length == 5) {
          for (Player player in Leaderboard.players) {
            if (score > player.score) {
              isSave = true;
              break;
            }
          }
        } else {
          isSave = true;
        }

        if (isSave) {
          return Container(
            child: Column(
              children: [
                const Text(
                  "Game is over!",
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your name',
                    ),
                    controller: playerController,
                    maxLength: 8,
                  )
                ),
                ElevatedButton(
                  child: const Text('Save your score'),
                  onPressed: () {
                    LeaderboardController.instance.addPlayer(
                      Player(playerController.text, score)
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuView())
                    );
                  },
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    child: const Text('Back'),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MenuView())
                      );
                    },
                  )
                )
              ],
            )
          );
        } else {
          return backToMenu;
        }
      }
    } else {
      return Text(
        "Score: $score",
        style: const TextStyle(fontSize: 30),
      );
    }
  }
}