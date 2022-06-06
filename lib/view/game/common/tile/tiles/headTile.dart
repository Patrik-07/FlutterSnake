import 'package:flutter/material.dart';
import 'package:snake/model/game/gameobject/gameobject.dart';
import 'package:snake/model/game/snake/snake.dart';

import '../tile.dart';

class HeadTile extends Tile {
  HeadTile({Key? key}) : super(key: key, 
    color: Color.fromRGBO(
      (Snake.color.red * 0.8).round(),
      (Snake.color.green * 0.8).round(), 
      (Snake.color.blue * 0.8).round(),
      Snake.color.opacity)
  );

  @override
  create(GameObject gameObject) {
    return HeadTile();
  }
}
