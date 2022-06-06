import 'package:snake/model/game/gameobject/gameobject.dart';
import 'package:snake/model/game/map.dart';
import 'package:snake/view/game/common/tile/tile.dart';

class MapController {
  MapController() {
    Map.reset(20, 20);
  }

  void reset() {
    Map.clearSnake();
  }

  Tile getTile(int row, int col) {
    GameObject gameObject = Map.get(row, col);
    return Tile.get(gameObject);
  }

}