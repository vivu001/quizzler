class Question {
  String _content;
  bool _solution;

  Question(this._content, this._solution);

  bool get solution => _solution;

  String get content => _content;
}
