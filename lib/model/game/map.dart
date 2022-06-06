import 'dart:math';

import 'package:snake/model/game/gameobject/gameobject.dart';
import 'package:snake/model/game/gameobject/gameobjects/all.dart';

class Map {
  static int rowCount = 0;
  static int colCount = 0;

  static late List<List<GameObject>> gameobjects;

  static void reset(int r, int c) {
    rowCount = r;
    colCount = c;
    gameobjects = List.generate(
      rowCount, (i) => List.filled(colCount, Empty(), growable: false),
      growable: false
    );

    for (int col = 0; col < colCount; col++) {
      gameobjects[0][col] = Wall();
    }
    for (int col = 0; col < colCount; col++) {
      gameobjects[rowCount-1][col] = Wall();
    }
    for (int row = 0; row < rowCount; row++) {
      gameobjects[row][0] = Wall();
    }
    for (int row = 0; row < rowCount; row++) {
      gameobjects[row][colCount-1] = Wall();
    }

    spawnFood();
  }

  static void clearSnake() {
    for (int row = 0; row < rowCount; row++) {
      for (int col = 0; col < colCount; col++) {
        if (gameobjects[row][col] is Part) {
          gameobjects[row][col] = Empty();
        }
      }
    }
  }

  static void spawnFood() {
    List<Position> potentialFoodPositions = [];

    for (int row = 0; row < rowCount; row++) {
      for (int col = 0; col < colCount; col++) {
        if (gameobjects[row][col] is Empty) {
          potentialFoodPositions.add(Position(row, col));
        }
      }
    }

    int randomIndex = Random().nextInt(potentialFoodPositions.length - 1);
    Position foodPos = potentialFoodPositions[randomIndex];

    gameobjects[foodPos.x][foodPos.y] = Food();
  }

  static GameObject get(int row, int col) {
    return gameobjects[row][col];
  }

  static void set(int row, int col, GameObject gameObject) {
    gameobjects[row][col] = gameObject;
  }
}

class Position {
  int x, y;
  Position(this.x, this.y);
}
