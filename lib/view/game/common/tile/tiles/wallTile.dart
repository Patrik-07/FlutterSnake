import 'package:flutter/material.dart';
import 'package:snake/model/game/gameobject/gameobject.dart';

import '../tile.dart';

class WallTile extends Tile {
  WallTile({Key? key}) : super(key: key, color: Colors.brown);

  @override
  create(GameObject gameObject) {
    return WallTile();
  }
}
