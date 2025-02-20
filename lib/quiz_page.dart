import 'package:flutter/material.dart';
import 'quiz_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank bank = QuestionBank();

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void displayMsg() {
    int userScore = bank.getScore();
    int maxScore = bank.getBankLength();
    Alert(
        context: context,
        title: "Finished!",
        desc:
            "You have reached the end of the quiz.\n\nYou got $userScore / $maxScore",
        buttons: [
          DialogButton(
            onPressed: () {
              Navigator.pop(context);
            },
            width: 120,
            color: Colors.blue,
            child: Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bank.scoreKeeper.score,
        ),
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
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (bank.isFinished()) {
                          displayMsg();
                          bank.reset();
                        } else {
                          bank.checkAnswer(true);
                          bank.nextQuestion();
                        }
                      });
                    },
                    style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(Size(100, 100)),
                        backgroundColor: WidgetStatePropertyAll(Colors.green),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
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
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (bank.isFinished()) {
                          displayMsg();
                          bank.reset();
                        } else {
                          bank.checkAnswer(false);
                          bank.nextQuestion();
                        }
                      });
                    },
                    style: ButtonStyle(
                      fixedSize: WidgetStatePropertyAll(Size(100, 100)),
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    child: Text(
                      "False",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
