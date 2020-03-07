import 'package:flutter/material.dart';

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
  List<Icon> scores = [];

  Map<String, bool> questions = {
    'You can lead a cow down stairs but not up stairs.': false,
    'Approximately one quarter of human bones are in the feet.': true,
    'A slug\'s blood is green.': true
  };

  int currentPos = 0;
  int _count = 0;

  void _addIcon() {
    if (currentPos < questions.length && _count == 0) {
      if (currentPos == questions.length - 1) _count++;
      bool result = questions.values.elementAt(currentPos);
      if (result) {
        scores.add(Icon(Icons.check, color: Colors.green));
      } else {
        scores.add(Icon(Icons.close, color: Colors.deepOrange));
      }
    }
  }

  Widget _showQuestion() {
    String question = questions.keys.elementAt(currentPos);
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _showQuestion(),
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
                  _addIcon();
                  if (currentPos < questions.length - 1) {
                    currentPos++;
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
                  _addIcon();
                  if (currentPos < questions.length - 1) {
                    currentPos++;
                  }
                });
              },
            ),
          ),
        ),
        Row(children: scores)
      ],
    );
  }
}
