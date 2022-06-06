import 'package:flutter/services.dart';
import 'package:snake/model/game/snake/direction.dart';
import 'package:snake/model/game/snake/snake.dart';

class SnakeController {
  Snake snake = Snake.instance;

  void resetSnake() {
    snake.reset();
  }

  bool updateSnake() {
    if (snake.isAlive) {
      snake.update();
    }
    return snake.isAlive;
  }

  void handleKeyboardEvent(RawKeyEvent event) {
    if (event.isKeyPressed(LogicalKeyboardKey.keyW)) {
      if (snake.direction != Direction.down) {
          snake.nextDirection = Direction.up;
      }
    } else if (event.isKeyPressed(LogicalKeyboardKey.keyA)) {
      if (snake.direction != Direction.right) {
          snake.nextDirection = Direction.left;
      }
    } else if (event.isKeyPressed(LogicalKeyboardKey.keyS)) {
      if (snake.direction != Direction.up) {
          snake.nextDirection = Direction.down;
      }
    } else if (event.isKeyPressed(LogicalKeyboardKey.keyD)) {
      if (snake.direction != Direction.left) {
          snake.nextDirection = Direction.right;
      }
    }
  }

  int getSnakeLength() {
    return snake.length;
  }

  int getInitialLength() {
    return snake.initialLength;
  }
}