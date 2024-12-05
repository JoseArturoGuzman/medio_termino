import 'package:flutter/material.dart';
import 'package:medio_termino/controllers/multi_quiz_controller.dart';
import 'results_page.dart';

class quiz_page extends StatefulWidget {
  const quiz_page({super.key});

  @override
  State<quiz_page> createState() => _quiz_pageState();
}

class _quiz_pageState extends State<quiz_page> {
  final MultiController _controller = MultiController();

  void _submitAnswer(String selectedAnswer) {
    _controller.checkAnswer(selectedAnswer);
    setState(() {
      if (!_controller.isFinished()) {
        _controller.nextQuestion();
      } else {
        final results = _controller.getResults();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => results_page(
              results: results,
              onRestart: () {
                _controller.resetQuiz();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const quiz_page()),
                );
              },
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _controller.getCurrentQuestion();
    final currentAnswers = _controller.getCurrentAnswers()..shuffle();
    final questionNumber = _controller.currentQuestionIndex + 1;
    final totalQuestions = _controller.totalQuestions;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pregunta $questionNumber / $totalQuestions",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.purple.shade700,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),

                ),
                child: Text(
                  currentQuestion,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              ...currentAnswers.map((answer) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    onPressed: () => _submitAnswer(answer),
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black.withOpacity(0.3),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      answer,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
