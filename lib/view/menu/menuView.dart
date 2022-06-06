import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snake/controller/controllers/leaderboardController.dart';
import 'package:snake/controller/gameController.dart';
import 'package:snake/view/menu/leaderboardView.dart';
import 'package:snake/view/menu/settingsView.dart';

import '../game/gameView.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 40),
              child: const Text(
                "Snake Game",
                style: TextStyle(fontSize: 30),
              )
            ),
            Container(
              width: 150,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton(
                child: const Text('Play'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => 
                      ChangeNotifierProvider<GameController>(
                        create: (context2) => GameController(),
                        child: GameView(),
                      )
                    )
                  );
                },
              )
            ),
            Container(
              width: 150,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton(
                child: const Text('Leaderboad'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LeaderboadView())
                  );
                },
              )
            ),
            Container(
              width: 150,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton(
                child: const Text('Settings'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsView())
                  );
                },
              )
            ),
            if (!kIsWeb) 
              Container(
                width: 150,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: ElevatedButton(
                  child: const Text('Quit'),
                  onPressed: () async {
                    await LeaderboardController.instance.savePlayers();
                    SystemNavigator.pop();
                    exit(0);
                  }
                )
              )
          ],
        )
      ),
    );
  }
}