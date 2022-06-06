import 'package:flutter/material.dart';
import 'package:snake/model/game/gameobject/gameobject.dart';

import '../tile.dart';

class GrassLightTile extends Tile {
  GrassLightTile({Key? key}) : super(key: key, color: const Color(0xFFA2D149));

  @override
  create(GameObject gameObject) {
    return GrassLightTile();
  }
}
