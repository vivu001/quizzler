import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:quizzler/IconImporter.dart';
import 'package:quizzler/Question.dart';
import 'package:quizzler/Questioner.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // import questions
  static Questioner questioner = Questioner();

  List<Question> qns = questioner.questions;

  Widget _nextQuestion() {
    String question = qns.elementAt(questioner.currentPos).content;
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _showQuestionDialog() {
    showAlert(
      context: context,
      title: "Finished!",
      body: "Play again?",
      actions: [
        AlertAction(
          text: "Play",
          isDestructiveAction: true,
          onPressed: () {
            // TODO
            setState(() {
              questioner.currentPos = 0;
              questioner.lastQuestionFlag = false;
              iconImporter.removeIcons();
            });
          },
        ),
      ],
      cancelable: true,
    );
  }

  // create importer for icon
  IconImporter iconImporter = IconImporter(questioner);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _nextQuestion(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  iconImporter.addIcon();
                  print(questioner.currentPos);
                  if (questioner.lastQuestionFlag) {
                    _showQuestionDialog();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  iconImporter.addIcon(answer: false);
                });
              },
            ),
          ),
        ),
        Row(children: iconImporter.scoreIcons)
      ],
    );
  }
}
