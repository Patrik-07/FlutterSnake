import 'package:snake/controller/gameController.dart';
import 'package:snake/view/game/common/grid/grid.dart';
import 'package:snake/view/game/common/tile/tile.dart';

class MapView extends Grid {
  static final MapView _instance = MapView._privateConstructor();
  static MapView get instance => _instance;

  MapView._privateConstructor() {
    reset();
  }

  void update() {
    for (int row = 0; row < 20; row++) {
      for (int col = 0; col < 20; col++) {
        Tile tile = GameController.getTile(row, col);
        set(col, row, tile);
      }
    }
  }
}