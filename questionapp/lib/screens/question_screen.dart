import 'dart:async';
import 'package:flutter/material.dart';
import '../data/LHtheme/questions.dart';
import '../data/JOtheme/questions.dart';
import '../data/ILtheme/questions.dart';
import '../data/MAtheme/questions.dart';
import '../widgets/QuestionWidget.dart';
import '../widgets/ScoreBoardWidget.dart';

class QuestionScreen extends StatefulWidget {
  final String theme;

  QuestionScreen({required this.theme});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late List questions;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;
  int totalTime = 0; // Temps total passé (en secondes)
  Timer? _timer; // Chronomètre pour la question actuelle
  int _currentQuestionTime = 0; // Temps passé sur la question actuelle

  @override
  void initState() {
    super.initState();

    // Sélectionne les questions en fonction du thème
    switch (widget.theme) {
      case 'LHtheme':
        questions = LHthemeQuestions;
        break;
      case 'JOtheme':
        questions = JOthemeQuestions;
        break;
      case 'ILtheme':
        questions = IlthemeQuestions;
        break;
      case 'MAtheme':
        questions = MAthemeQuestions;
        break;
      default:
        questions = [];
    }

    _startTimer(); // Démarre le chronomètre pour la première question
  }

  void _startTimer() {
    _currentQuestionTime = 0; // Réinitialise le temps de la question
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentQuestionTime++;
        totalTime++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel(); // Arrête le chronomètre
  }

  void _submitAnswer(dynamic selectedOption) {
    final currentQuestion = questions[currentQuestionIndex];

    _stopTimer(); // Arrête le chronomètre pour la question actuelle

    if (selectedOption == currentQuestion.correctAnswer) {
      correctAnswers++;
    } else {
      incorrectAnswers++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
      _startTimer(); // Redémarre le chronomètre pour la question suivante
    } else {
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Merci !"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Thème : ${widget.theme}',
            style: const TextStyle(fontSize: 18, fontFamily: 'DotGothic16'),
          ),
        ),
        body: const Center(
          child: Text(
            'No questions available for this theme.',
            style: TextStyle(fontSize: 18, fontFamily: 'DotGothic16'),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thème : ${widget.theme}',
          style: const TextStyle(fontSize: 18, fontFamily: 'DotGothic16'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Scoreboard Widget
            ScoreBoardWidget(
              scores: {
                'Correct': correctAnswers,
                'Incorrect': incorrectAnswers,
                'Time': totalTime, // Temps total en secondes
              },
            ),
            const SizedBox(height: 20),
            // Question Widget
            Center(
              child: QuestionWidget(
                question: questions[currentQuestionIndex],
                onSubmit: _submitAnswer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

