class QuestionModel {
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

List<QuestionModel> generateRandomQuestions() {
  return [
    QuestionModel(
      question: "What is Flutter?",
      options: ["A programming language", "A UI toolkit", "A database", "A framework"],
      correctAnswer: "A UI toolkit",
    ),
    QuestionModel(
      question: "What is Dart?",
      options: ["A programming language", "A UI toolkit", "A database", "A framework"],
      correctAnswer: "A programming language",
    ),
    QuestionModel(
      question: "What is a widget?",
      options: ["A UI component", "A database", "A programming language", "A framework"],
      correctAnswer: "A UI component",
    ),
    // Daha fazla rastgele soru ekleyebilirsiniz
  ];
}
