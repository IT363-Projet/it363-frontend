// chemin lib/screens/question_screen.dart

import 'package:flutter/material.dart';
import '../data/LHtheme/questions.dart';
import '../data/JOtheme/questions.dart';
import '../data/ILtheme/questions.dart';
import '../data/MAtheme/questions.dart';
import '../widgets/QuestionWidget.dart';

class QuestionScreen extends StatefulWidget {
  final String theme;

  const QuestionScreen({Key? key, required this.theme}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> 
{

  late List questions; // Liste des questions en fonction du thème
  int currentQuestionIndex = 0; // Index de la question actuelle

  @override
  void initState() 
  {
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
  }

  void _submitAnswer(dynamic selectedOption) 
  { 
      final currentQuestion = questions[currentQuestionIndex];

      // Choix multiples
      if (currentQuestion.questionType == 'multiple_choice') 
      {
          if (selectedOption == currentQuestion.correctAnswer) {print("Correct answer!");} 
          else {print("Incorrect. Correct answer: ${currentQuestion.correctAnswer}");}
      } 
      
      // Slider
      else if (currentQuestion.questionType == 'slider') {print("Slider value selected: $selectedOption");} 

      // Ranking
      else if (currentQuestion.questionType == 'ranking') {print("Ranking submitted: $selectedOption");}

      // Réponse correct ou non
      if (selectedOption == questions[currentQuestionIndex].correctAnswer) {print("Correct!");} 
      else {print("Incorrect. Correct answer: ${questions[currentQuestionIndex].correctAnswer}");}

      // Question suivante
      if (currentQuestionIndex < questions.length - 1) {setState(() {currentQuestionIndex++;});} 
      else { _showCompletionDialog();}
  }

  void _showCompletionDialog() 
  {
      showDialog
      (
          context: context,
          builder: (context) 
          {
              return AlertDialog
              (
                  title: const Text("Merci !"),
                  actions: [TextButton(onPressed: () {Navigator.of(context).pop(); Navigator.of(context).pop(); }, child: const Text("OK"),),],
              );
          },
      );
  }

  @override
  Widget build(BuildContext context) 
  {
      if (questions.isEmpty) 
      {
          return Scaffold
          (
              appBar: AppBar(title: Text('Thème : ${widget.theme}', style: const TextStyle(fontSize: 18, fontFamily: 'DotGothic16')),),
              body: const Center(child: Text('No questions available for this theme.', style: TextStyle(fontSize: 18, fontFamily: 'DotGothic16'),),),
          );
      }

      return Scaffold
      (
          appBar: AppBar
          (
              title: Text('Thème : ${widget.theme}', style: const TextStyle(fontSize: 18, fontFamily: 'DotGothic16'),),
              centerTitle: true
          ),
          body: Center(child: QuestionWidget(question: questions[currentQuestionIndex], onSubmit: _submitAnswer),),
      );
  }
}
