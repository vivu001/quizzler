import 'package:quizzler/Question.dart';

class Questioner {
  int _currentPos = 0;

  List<Question> _questions = [];

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
    _currentPos = (value < _questions.length) ? value : value - 1;
  }

  List<Question> get questions => _questions;

  bool isLastQuestion() {
    return (currentPos == questions.length - 1);
  }
}
