class Question {
  String questionImage;
  String questionText;
  bool questionAnswer;

  Question({required String q, required String i, required bool a})
      : questionText = q,
        questionImage = i,
        questionAnswer = a;
}
