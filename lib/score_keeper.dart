import 'package:flutter/material.dart';

class ScoreKeeper {
  List<Icon> score = [];

  Icon correct = Icon(
    Icons.check_box,
    color: Colors.green,
  );

  Icon wrong = Icon(
    Icons.close,
    color: Colors.red,
  );

  void addCorrect() {
    score.add(correct);
  }

  void addWrong() {
    score.add(wrong);
  }
}
