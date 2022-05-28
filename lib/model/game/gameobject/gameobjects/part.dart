import 'package:snake/model/game/gameobject/gameobject.dart';

class Part extends GameObject {
  static int count = 0;
  int index = count++;

  int x, y;
  Part(this.x, this.y);

  @override
  void collideWithSnake() {
    //Snake.isAlive = false
  }
}
