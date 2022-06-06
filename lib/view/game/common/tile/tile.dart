import 'package:flutter/material.dart';
import 'package:snake/model/game/gameobject/gameobject.dart';
import 'package:snake/model/game/gameobject/gameobjects/all.dart';
import 'package:snake/view/game/common/tile/tiles/emptyTile.dart';
import 'package:snake/view/game/common/tile/tiles/foodTile.dart';
import 'package:snake/view/game/common/tile/tiles/headTile.dart';
import 'package:snake/view/game/common/tile/tiles/partTile.dart';
import 'package:snake/view/game/common/tile/tiles/wallTile.dart';

abstract class Tile extends Container {
  Tile({Key? key, required super.color}) : super(key: key);

  static Map<Type, Tile> tiles = {
    Empty : EmptyTile(),
    Wall : WallTile(),

    Food: FoodTile(),

    Head : HeadTile(),
    Part : PartTile()
  };

  static Tile get(GameObject gameObject) {
    Tile? tile = tiles[gameObject.runtimeType];
    return tile?.create(gameObject);
  }

  create(GameObject gameObject);
}