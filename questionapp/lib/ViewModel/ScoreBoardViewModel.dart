import 'dart:async';
import 'package:flutter/foundation.dart';


class ScoreBoardViewModel {
  final Map<String, int> scores;
  final ValueNotifier<int> totalTimeNotifier = ValueNotifier<int>(0);
  Timer? _timer;

  ScoreBoardViewModel(this.scores) {
    startTimer(); // Démarrer le chronomètre
  }

  // Méthode pour démarrer le chronomètre
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      totalTimeNotifier.value += 1;
      scores['Time'] = totalTimeNotifier.value; // Met à jour la valeur du temps
    });
  }

  // Méthode pour arrêter le chronomètre
  void stopTimer() {
    _timer?.cancel();
  }

  // Méthode pour déterminer la couleur en fonction du label
  String getColor(String label) {
    switch (label.toLowerCase()) {
      case 'correct':
        return 'green';
      case 'incorrect':
        return 'red';
      default:
        return 'blue';
    }
  }

  // Méthode pour formater les secondes en minutes:secondes
  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  // Préparer les données finales pour affichage (clé, valeur, couleur)
  List<Map<String, dynamic>> prepareScoreData() {
    return scores.entries.map((entry) {
      return {
        'label': entry.key,
        'value': entry.key.toLowerCase() == 'time'
            ? formatTime(entry.value)
            : entry.value.toString(),
        'color': getColor(entry.key),
      };
    }).toList();
  }
}
