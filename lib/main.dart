import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  // List<String> questions = [
  //   "You can lead a cow upstairs, but not downstairs.",
  //   "Approximately one quarter of human bones are in the feet",
  //   "A slug's blood is green."
  // ];

  // List<bool> answers = [false, true, true];

  List<Question> questionBank = [
    Question("You can lead a cow upstairs, but not downstairs.", false),
    Question("Approximately one quarter of human bones are in the feet", true),
    Question("A slug's blood is green.", true)
  ];

  Icon correct = Icon(
    Icons.check_box,
    color: Colors.green,
  );

  Icon wrong = Icon(
    Icons.close,
    color: Colors.red,
  );

  int questionNumber = 0;
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
                questionBank[questionNumber].questionText,
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
                    if (questionBank[questionNumber].questionAnswer) {
                      scoreKeeper.add(correct);
                      score++;
                    } else {
                      scoreKeeper.add(wrong);
                    }
                    if (questionNumber < questionBank.length - 1) {
                      questionNumber++;
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScorePage(score: score)));
                    }
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
                    if (!questionBank[questionNumber].questionAnswer) {
                      scoreKeeper.add(correct);
                      score++;
                    } else {
                      scoreKeeper.add(wrong);
                    }
                    if (questionNumber < questionBank.length - 1) {
                      questionNumber++;
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScorePage(score: score)));
                    }
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
          children: scoreKeeper,
        )
      ],
    );
  }
}

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
