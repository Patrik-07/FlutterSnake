import 'package:flutter/material.dart';
import 'package:snake/model/game/gameobject/gameobject.dart';

import '../tile.dart';

class GrassDarkTile extends Tile {
  GrassDarkTile({Key? key}) : super(key: key, color: const Color(0xFF82B432));
  @override
  create(GameObject gameObject) {
    return GrassDarkTile();
  }
}
