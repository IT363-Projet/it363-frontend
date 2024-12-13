import 'package:flutter/material.dart';

class ScoreBoardWidget extends StatelessWidget {
  final Map<String, int> scores; // Map pour tous les scores

  const ScoreBoardWidget({
    Key? key,
    required this.scores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const Text(
            'Scoreboard',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Génération des tuiles dynamiquement
          ...scores.entries.map((entry) => _buildScoreTile(entry.key, entry.value)),
        ],
      ),
    );
  }

  Widget _buildScoreTile(String label, int count) {
    final color = label.toLowerCase() == 'correct'
        ? Colors.green
        : label.toLowerCase() == 'incorrect'
            ? Colors.red
            : Colors.blue; // Couleur par défaut pour les autres types

    // Si le type est "Time", formater en minutes et secondes
    String displayValue = label.toLowerCase() == 'time'
        ? _formatTime(count)
        : count.toString();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          displayValue,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  // Méthode pour formater le temps en minutes:secondes
  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
