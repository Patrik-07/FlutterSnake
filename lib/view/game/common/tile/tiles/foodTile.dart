import 'package:flutter/material.dart';
import 'package:snake/model/game/gameobject/gameobject.dart';

import '../tile.dart';

class FoodTile extends Tile {
  FoodTile({Key? key}) : super(key: key, color: Colors.blue);

  @override
  create(GameObject gameObject) {
    return FoodTile();
  }
}
