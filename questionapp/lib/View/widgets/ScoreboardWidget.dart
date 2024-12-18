import 'package:flutter/material.dart';

class ScoreBoardWidget extends StatelessWidget {
  final ValueNotifier<int> totalTimeNotifier; // Notifier pour le temps
  final int correctAnswers;
  final int incorrectAnswers;
  final String title;

  const ScoreBoardWidget({
    Key? key,
    required this.totalTimeNotifier,
    required this.correctAnswers,
    required this.incorrectAnswers,
    this.title = 'Scoreboard',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: totalTimeNotifier,
      builder: (context, totalTime, child) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildScoreTile('Correct', correctAnswers, Colors.green),
              _buildScoreTile('Incorrect', incorrectAnswers, Colors.red),
              _buildScoreTile('Time', totalTime, Colors.blue),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScoreTile(String label, int value, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          label == 'Time' ? _formatTime(value) : value.toString(),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}


