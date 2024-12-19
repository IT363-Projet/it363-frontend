import 'dart:async';
import 'package:flutter/foundation.dart'; // Import nécessaire pour ValueNotifier
import '../Model/data/ExportQuestions.dart';
import '../Model/models/Question.dart';

class QuestionViewModel {
  late List<Question> questions;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;

  final ValueNotifier<int> totalTime =
      ValueNotifier<int>(0); // Chronomètre réactif
  Timer? _timer;

  QuestionViewModel(String theme) {
    _loadQuestions(theme);
    _startTimer(); // Démarre le chronomètre une seule fois
  }

  void _loadQuestions(String theme) {
    switch (theme) {
      case 'Space':
        questions = spaceThemeQuestions;
        break;
      case 'Geography':
        questions = geographyThemeQuestions;
        break;
      case 'SciFiMovies':
        questions = sciFiThemeQuestions;
        break;
      case 'Mythology':
        questions = mythologyThemeQuestions;
        break;
      case 'Sports':
        questions = sportsThemeQuestions;
        break;
      default:
        questions = [];
    }
  }

  // Méthode pour démarrer le chronomètre
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      totalTime.value += 1; // Met à jour le ValueNotifier
    });
  }

  // Méthode pour arrêter le chronomètre
  void stopTimer() {
    _timer?.cancel();
  }

  // Méthode appelée lors de la soumission d'une réponse
  bool submitAnswer(dynamic selectedOption) {
    final currentQuestion = questions[currentQuestionIndex];

    if (selectedOption.toString() == currentQuestion.correctAnswer.toString()) {
      correctAnswers++;
      return true;
    } else {
      incorrectAnswers++;
      return false;
    }
  }

  // Méthode pour passer à la question suivante
  bool goToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
      return true;
    } else {
      stopTimer(); // Arrête le chronomètre à la fin du quiz
      return false;
    }
  }
}
