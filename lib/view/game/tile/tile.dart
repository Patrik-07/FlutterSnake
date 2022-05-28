import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:snake/model/game/gameobject/gameobjects/all.dart';

import 'tiles/emptyTile.dart';

abstract class Tile extends Rect {
  static Map<String, Tile> tiles = {
    (Empty).toString() : EmptyTile(),
    (Wall).toString() : WallTile(),

    (Food).toString() to FoodTile(),

    ().toString() to HeadTile(),
    (Wall).toString() to PartTile()
  };

  static Tile get() {}
}
