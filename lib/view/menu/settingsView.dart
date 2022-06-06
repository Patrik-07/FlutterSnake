import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:snake/model/game/snake/snake.dart';
import 'package:snake/view/menu/menuView.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: Center(
        child: Column(
          children: [
          Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                "Select a color!",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: 250,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: BlockPicker(
                pickerColor: Snake.color,
                onColorChanged: (Color color) { Snake.color = color; },
              ),
            ),
            Container(
              width: 150,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton(
                child: const Text('Back'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuView())
                  );
                },
              )
            ),
          ],
        )
      ),
    );
  }
}