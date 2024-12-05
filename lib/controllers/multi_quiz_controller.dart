
import 'package:medio_termino/models/multi_quiz.dart';

class MultiController{
  int _questionNumber = 0;
  double _minimunCompleteQuestion =  0.7;
  final List<MultiQuiz> _questionBank =[
    MultiQuiz(
        question: "Abel Magwitch is a character from which Charles Dickens novel?",
        correctAnswer: "Great Expectations",
        incorrectAnswers: ["The Pickwick Papers", "Nicholas Nickleby", "Oliver Twist"]),
    MultiQuiz(
        question: "What is Hermione Granger's middle name?",
        correctAnswer: "Jean",
        incorrectAnswers: ["Jane", "Emma", "Jo"]),
    MultiQuiz(
        question: "In the Magic: The Gathering universe, the Antiquities, Ice Age, and Alliances expansions take place on which continent?",
        correctAnswer: "Terisiare",
        incorrectAnswers: ["Aerona", "Shiv", "Jamuraa"]),
    MultiQuiz(
        question: "How many books are in the Chronicles of Narnia series?",
        correctAnswer: "7",
        incorrectAnswers: ["6", "8", "5"]),
    MultiQuiz(
        question: "Which of the following was the author of 'Username Evie'?",
        correctAnswer: "Joe Sugg",
        incorrectAnswers: ["Zoe Sugg", "Joe Weller", "Alfie Deyes"]),
    MultiQuiz(
        question: "In The Lies Of Locke Lamora, what does 'Lamora' mean in Throne Therin?",
        correctAnswer: "Shadow",
        incorrectAnswers: ["Thievery", "Justice", "Chaos"]),
    MultiQuiz(
        question: "Which author co-wrote 'The Communist Manifesto' alongside Karl Marx?",
        correctAnswer: "Friedrich Engels",
        incorrectAnswers: ["Robert Owen", "Alexander Kerensky", "Paul Lafargue"]),
    MultiQuiz(
        question: "What was Sir Handel's original name in 'The Railway Series' and its animated counterpart 'Thomas and Friends?'",
        correctAnswer: "Falcon",
        incorrectAnswers: ["Eagle", "Kyte", "Swallow"]),
    MultiQuiz(
        question: "What's Harry Potter's dad's name?",
        correctAnswer: "James Potter",
        incorrectAnswers: ["Joey Potter", "Frank Potter", "Hairy Potter Sr."]),
    MultiQuiz(
        question: "In the Magic: The Gathering universe, which plane does the Homelands expansion take place in?",
        correctAnswer: "Ulgrotha",
        incorrectAnswers: ["Bant", "Llanowar", "Tazeem"]),
  ];
  final List<Map<String, dynamic>> _userAnswers = [];

  String getCurrentQuestion() {
    return _questionBank[_questionNumber].question;
  }

  List<String> getCurrentAnswers() {
    return [
      _questionBank[_questionNumber].correctAnswer,
      ..._questionBank[_questionNumber].incorrectAnswers
    ];
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].correctAnswer;
  }

  bool checkAnswer(String userAnswer) {
    final isCorrect = userAnswer == _questionBank[_questionNumber].correctAnswer;
    _userAnswers.add({
      'question': _questionBank[_questionNumber].question,
      'selectedAnswer': userAnswer,
      'correctAnswer': _questionBank[_questionNumber].correctAnswer,
      'isCorrect': isCorrect,
    });
    return isCorrect;
  }

  void resetQuiz() {
    _questionNumber = 0;
    _userAnswers.clear();
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  List<Map<String, dynamic>> getResults() {
    return _userAnswers;
  }

  int get currentQuestionIndex => _questionNumber; // Getter público
  int get totalQuestions => _questionBank.length;  // Total de preguntas


}