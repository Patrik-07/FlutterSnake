import '../common/grid/grid.dart';
import '../common/tile/tiles/grassDarkTile.dart';
import '../common/tile/tiles/grassLightTile.dart';

class BackgroundView extends Grid {
  BackgroundView() {
    for (int row = 0; row < 20; row++) {
      for (int col = 0; col < 20; col++) {
          if ((row + col) % 2 == 0) {
              list[20 * row + col] = GrassDarkTile();
          } else {
            list[20 * row + col] = GrassLightTile();
          }
      }
    }
    reset();
  }
}