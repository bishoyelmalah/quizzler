import 'package:flutter/material.dart';
import 'quiz_bank.dart';

QuestionBank bank = QuestionBank();

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                bank.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    bank.checkAnswer(true);
                    bank.nextQuestion();
                  });
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)))),
                child: Text(
                  "True",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    bank.checkAnswer(false);
                    bank.nextQuestion();
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
                ),
                child: Text(
                  "False",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
          ),
        ),
        Row(
          children: bank.scoreKeeper.score,
        )
      ],
    );
  }
}
