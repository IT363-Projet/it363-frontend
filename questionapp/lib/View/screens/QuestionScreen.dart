import 'package:flutter/material.dart';
import '../widgets/QuestionWidget.dart';
import '../widgets/ScoreBoardWidget.dart';
import '../../ViewModel/QuestionViewModel.dart';

class QuestionScreen extends StatefulWidget {
  final String theme;
  final VoidCallback toggleTheme;

  const QuestionScreen({required this.theme, required this.toggleTheme});

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
    final theme = Theme.of(context);
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
        backgroundColor: theme.primaryColor,
        actions: [
          IconButton(
            icon: Icon(theme.brightness == Brightness.dark
                ? Icons.brightness_7
                : Icons.brightness_2),
            onPressed: widget.toggleTheme,
          ),
        ],
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