import 'package:flutter/material.dart';

import '../gameobject/gameobjects/head.dart';
import '../gameobject/gameobjects/part.dart';
import 'direction.dart';
import '../map.dart';

class Snake {
  List<Part> body = [];

  static Color color = Colors.red;

  bool isAlive = true;

  int direction = Direction.right;
  int nextDirection = Direction.right;

  int initialLength = 3;
  int get length => body.length;

  static final Snake _instance = Snake._privateConstructor();
  static Snake get instance => _instance;

  Snake._privateConstructor() {
    reset();
  }

  void reset() {
    isAlive = true;
    direction = Direction.right;
    nextDirection = Direction.right;

    Part.count = 0;
    body.clear();

    int centerX = Map.rowCount ~/ 2;
    int centerY = Map.colCount ~/ 2;

    body.add(Head(centerX, centerY));

    for (int i = 0; i < initialLength - 1; i++) {
      body.add(Part(centerX, centerY));
    }
  }

  void update() {
    _move();
    if (isAlive) {
      Map.clearSnake();
      for (Part part in body) {
        Map.set(part.x, part.y, part);
      }
    }
  }

  void grow() {
    Part lastPart = body.last;
    body.add(Part(lastPart.x, lastPart.y));

    Map.spawnFood();
  }

  void _move() {
    var lastX = body[0].x;
    var lastY = body[0].y;

    for (int i = 1; i < body.length; i++) {
      int currentX = body[i].x;
      int currentY = body[i].y;

      body[i].x = lastX;
      body[i].y = lastY;

      lastX = currentX;
      lastY = currentY;
    }



    switch (nextDirection) {
      case Direction.up:
        body[0].y--;
        break;
      case Direction.left:
        body[0].x--;
        break;
      case Direction.down:
        body[0].y++;
        break;
      case Direction.right:
        body[0].x++;
        break;
    }

    direction = nextDirection;

    Map.get(body[0].x, body[0].y).collideWithSnake();
  }
}
