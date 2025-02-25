import 'package:flutter/material.dart';
import 'package:quizzler/Questioner.dart';
import 'Question.dart';

class IconImporter {
  Questioner _questioner;
  List<Icon> _scoreIcons = [];

  IconImporter(this._questioner);

  void addIcon({bool answer = true}) {
    if (_questioner.currentPos < _questioner.questions.length &&
        !_questioner.lastQuestionFlag) {
      Question currentQuestion =
          _questioner.questions.elementAt(_questioner.currentPos);

      // add Icon
      if (currentQuestion.solution && answer) {
        _scoreIcons.add(Icon(Icons.check, color: Colors.green));
      } else {
        _scoreIcons.add(Icon(Icons.close, color: Colors.deepOrange));
      }

      (_questioner.currentPos == _questioner.questions.length - 1)
          ? _questioner.lastQuestionFlag = true
          : _questioner.currentPos++;
    }
  }

  List<Icon> get scoreIcons => _scoreIcons;
}
