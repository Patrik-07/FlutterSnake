import 'package:flutter/material.dart';
import 'package:snake/model/game/gameobject/gameobject.dart';

import '../tile.dart';

class EmptyTile extends Tile {
  EmptyTile({Key? key}) : super(key: key, color: Colors.transparent);

  @override
  create(GameObject gameObject) {
    return EmptyTile();
  }
}
