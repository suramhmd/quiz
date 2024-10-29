import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'app_brain.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(const quiz());
}

class quiz extends StatelessWidget {
  const quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 189, 188, 188),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(104, 103, 103, 1),
          title: const Text("quiz"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: quizpage(),
        ),
      ),
    );
  }
}

class quizpage extends StatefulWidget {
  const quizpage({super.key});

  @override
  State<quizpage> createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
  List<Widget> answerResult = [];
  int rightAnswer = 0;
  void checkAnswer(bool whatuserpicked) {
    bool correctAnswer = appBrain.getquestionanswer();
    setState(
      () {
        if (whatuserpicked == correctAnswer) {
          rightAnswer++;
          answerResult.add(
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.thumb_up,
                color: Colors.green,
              ),
            ),
          );
        } else {
          answerResult.add(
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.thumb_down,
                color: Colors.red,
              ),
            ),
          );
        }
        if (appBrain.isfinished() == true) {
          Alert(
            context: context,
            type: AlertType.error,
            title: "All questions have ended",
            desc: "you have answer $rightAnswer correct",
            buttons: [
              DialogButton(
                child: Text(
                  "start again",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
          appBrain.reset();
          answerResult = [];
          rightAnswer = 0;
        } else {
          appBrain.nextquestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(appBrain.getquestionimage()),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                appBrain.getquestiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              color: const Color.fromARGB(255, 14, 90, 151),
              child: TextButton(
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                  "correct",
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              color: const Color.fromARGB(255, 151, 14, 14),
              child: TextButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  "wrong",
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
