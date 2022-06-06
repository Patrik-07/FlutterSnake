import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake/controller/controllers/mapController.dart';
import 'package:snake/controller/controllers/snakeController.dart';
import 'package:snake/controller/gameController.dart';
import 'package:snake/view/game/map/backgroundView.dart';

import 'map/mapView.dart';

class GameView extends StatelessWidget {
  GameView({ Key? key }) : super(key: key);

  MapController mapController = MapController();
  SnakeController snakeController = SnakeController();

  @override
  Widget build(BuildContext context) {
    double h = 500;
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        h = 400;
      }
    } catch (e) {
      h = 500;
    }

    final gameController = Provider.of<GameController>(context);
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        snakeController.handleKeyboardEvent(event);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Game'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  "Let's play!",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 500,
                height: h,
                child: Stack(
                  children: [
                    BackgroundView().gridView,
                    MapView.instance.gridView,
                  ],
                )
              ),
              Container(
                child: gameController.getBottomWidget(context)
              ),
            ],
          )
        )
      )
    );
  }
}