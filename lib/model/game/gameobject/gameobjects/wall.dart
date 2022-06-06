import 'package:snake/model/game/gameobject/gameobject.dart';
import 'package:snake/model/game/snake/snake.dart';

class Wall extends GameObject {
  @override
  void collideWithSnake() {
    Snake.instance.isAlive = false;
  }
}
