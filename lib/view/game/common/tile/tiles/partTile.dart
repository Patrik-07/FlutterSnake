import 'package:flutter/material.dart';
import 'package:snake/model/game/gameobject/gameobject.dart';
import 'package:snake/model/game/snake/snake.dart';

import '../tile.dart';

class PartTile extends Tile {
  PartTile({Key? key}) : super(key: key, color: Snake.color);

  @override
  create(GameObject gameObject) {
    return PartTile();
  }
}
