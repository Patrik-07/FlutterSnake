import 'package:snake/model/game/gameobject/gameobject.dart';
import 'package:snake/model/game/snake/snake.dart';

class Part extends GameObject {
  static int count = 0;
  int index = count++;

  int x, y;
  Part(this.x, this.y);

  @override
  void collideWithSnake() {
    Snake.instance.isAlive = false;
  }
}
