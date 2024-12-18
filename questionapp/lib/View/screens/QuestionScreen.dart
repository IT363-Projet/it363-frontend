import 'package:flutter/material.dart';
import '../widgets/QuestionWidget.dart';
import '../widgets/ScoreBoardWidget.dart';
import '../../ViewModel/QuestionViewModel.dart';

class QuestionScreen extends StatefulWidget {
  final String theme;

  const QuestionScreen({required this.theme});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late QuestionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = QuestionViewModel(widget.theme);
  }

  void _handleAnswer(dynamic selectedOption) {
    bool isCorrect = _viewModel.submitAnswer(selectedOption.toString());
    setState(() {});

    if (!_viewModel.goToNextQuestion()) {
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
    if (_viewModel.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Thème : ${widget.theme}')),
        body: const Center(child: Text('No questions available for this theme.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Thème : ${widget.theme}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ScoreBoardWidget(
              totalTimeNotifier: _viewModel.totalTime,
              correctAnswers: _viewModel.correctAnswers,
              incorrectAnswers: _viewModel.incorrectAnswers,
            ),
            const SizedBox(height: 20),
            Center(
              child: QuestionWidget<dynamic>(
                question: _viewModel.questions[_viewModel.currentQuestionIndex],
                onSubmit: _handleAnswer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

