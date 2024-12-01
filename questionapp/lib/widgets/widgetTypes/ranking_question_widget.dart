// chemin lib/widgets/widgetTypes/ranking_widget.dart

import 'package:flutter/material.dart';
import '../../models/question.dart';

class RankingQuestionWidget extends StatefulWidget {
  final Question question;
  final Function(Map<String, int>) onSubmit;

  const RankingQuestionWidget({Key? key, required this.question, required this.onSubmit}) : super(key: key);

  @override
  _RankingQuestionWidgetState createState() => _RankingQuestionWidgetState();
}

class _RankingQuestionWidgetState extends State<RankingQuestionWidget> {
  Map<String, int> rankings = {}; // Stocke le classement de chaque élément

  @override
  void initState() {
    super.initState();
    // Initialiser tous les éléments avec des valeurs par défaut
    rankings = { for (var k in widget.question.rankingOptions!.keys) k : 1 };
  }

  void _updateRankings(String option, int newValue) {
    setState(() {
      // Trouver l'élément qui a déjà la nouvelle valeur
      //String? existingOption = rankings.keys.firstWhere((key) => rankings[key] == newValue, orElse: () => null);
      String existingOption = rankings.keys.firstWhere((key) => rankings[key] == newValue,orElse: () => "",);

      // ignore: unnecessary_null_comparison
      if (existingOption != null) {
        // L'ancien élément avec la nouvelle valeur prend la valeur actuelle de l'option
        rankings[existingOption] = rankings[option]!;
      }
      // Mettre à jour l'option avec la nouvelle valeur
      rankings[option] = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.question.questionText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...widget.question.rankingOptions!.keys.map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(option, style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 20),
                  DropdownButton<int>(
                    value: rankings[option],
                    items: List.generate(
                      4,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text((index + 1).toString()),
                      ),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        _updateRankings(option, value);
                      }
                    },
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => widget.onSubmit(rankings),
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}

