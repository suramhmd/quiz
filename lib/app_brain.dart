import 'question.dart';

class AppBrain {
  int _questionNumber = 0;
  List<Question> _questionQroupe = [
    Question(
      q: "The number of planets in the solar system is 8",
      i: "images/image-1.jpg",
      a: true,
    ),
    Question(
      q: "Cats are carnivorous animals",
      i: "images/image-2.jpg",
      a: true,
    ),
    Question(
      q: "China is located in the African continent",
      i: "images/image-3.jpg",
      a: false,
    ),
    Question(
      q: "The Earth is flat and not spherical",
      i: "images/image-4.jpg",
      a: false,
    ),
  ];
  void nextquestion() {
    if (_questionNumber < _questionQroupe.length - 1) {
      _questionNumber++;
    }
  }

  String getquestiontext() {
    return _questionQroupe[_questionNumber].questionText;
  }

  String getquestionimage() {
    return _questionQroupe[_questionNumber].questionImage;
  }

  bool getquestionanswer() {
    return _questionQroupe[_questionNumber].questionAnswer;
  }

  bool isfinished() {
    if (_questionNumber >= _questionQroupe.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
