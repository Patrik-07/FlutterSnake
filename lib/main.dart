import 'package:flutter/material.dart';
import 'package:snake/controller/controllers/leaderboardController.dart';
import 'package:snake/view/menu/menuView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  readPlayers();
  runApp(const MaterialApp(
    title: 'Snake game',
    home: MenuView(),
  ));
}

void readPlayers() async {
  await LeaderboardController.instance.readPlayers();
}