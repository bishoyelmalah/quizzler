import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You Got \n $score / 10",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal[900],
                fontSize: 60,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Restart.restartApp(notificationTitle: "Restarting App");
                },
                child: Icon(Icons.restart_alt_outlined))
          ],
        ),
      ),
    );
  }
}
