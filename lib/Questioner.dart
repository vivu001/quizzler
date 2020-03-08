import 'package:quizzler/Question.dart';

class Questioner {
  static int _currentPos = 0;

  List<Question> _questions = [];
  bool _lastQuestionFlag = false;

  Questioner() {
    _questions = [
      Question('You can lead a cow down stairs but not up stairs.', false),
      Question(
          'Approximately one quarter of human bones are in the feet.', true),
      Question('A slug\'s blood is green.', true)
    ];
  }

  int get currentPos {
    return _currentPos;
  }

  set currentPos(int value) {
    _currentPos = value;
  }

  List<Question> get questions => _questions;

  bool get lastQuestionFlag => _lastQuestionFlag;

  set lastQuestionFlag(bool value) {
    _lastQuestionFlag = value;
  }
}
