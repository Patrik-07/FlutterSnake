import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake/controller/gameController.dart';
import 'package:snake/model/leaderboard/leaderboard.dart';
import 'package:snake/view/menu/menuView.dart';

import '../game/gameView.dart';

class LeaderboadView extends StatelessWidget {
  const LeaderboadView({super.key});

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
              margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: const Text(
                "Top 5 players!",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              height: 100,
              width: 220,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: Leaderboard.players.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 20,
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(Leaderboard.players[index].name),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: 100,
                            child: Text(Leaderboard.players[index].score.toString()),
                          ),
                        ]
                      )
                    ),
                  );
                }
              ),
            ),
            Container(
              width: 150,
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
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