import 'package:flutter/material.dart';

class ScoreBoardWidget extends StatelessWidget {
  final ValueNotifier<int> totalTimeNotifier;
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
    final theme = Theme.of(context);

    return ValueListenableBuilder<int>(
      valueListenable: totalTimeNotifier,
      builder: (context, totalTime, child) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.2),
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
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildScoreTile('Correct', correctAnswers, theme.colorScheme.primary),
                  _buildScoreTile('Time', totalTime, theme.colorScheme.secondary),
                  _buildScoreTile('Incorrect', incorrectAnswers, theme.colorScheme.error),
                ],
              ),
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
        const SizedBox(height: 4),
        Text(
          label == 'Time' ? _formatTime(value) : value.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
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


