import 'package:flutter/cupertino.dart';
import 'package:snake/view/game/common/tile/tiles/emptyTile.dart';
import 'package:snake/view/game/common/tile/tiles/foodTile.dart';

import '../tile/tile.dart';

class Grid {
  final List<Widget> list = [];
  late GridView gridView;

  Grid() {
    for (int row = 0; row < 20; row++) {
      for (int col = 0; col < 20; col++) {
          list.add(EmptyTile());
      }
    }

    reset();
  }

  void set(int col, int row, Tile tile) {
    list[20 * col + row] = tile;
    reset();
  }

  void reset() {
        gridView = GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 20),
      itemBuilder: (BuildContext context, int index) {
        return Container(child: list[index]);
      }
    );
  }
}