// chemin lib/widgets/widgetTypes/ranking_widget.dart

import 'package:flutter/material.dart';
import '../../Model/models/question.dart';

class RankingQuestionWidget extends StatefulWidget {
  final Question question;
  final Function(Map<String, int>) onSubmit;

  RankingQuestionWidget({required this.question, required this.onSubmit});

  @override
  _RankingQuestionWidgetState createState() => _RankingQuestionWidgetState();
}

class _RankingQuestionWidgetState extends State<RankingQuestionWidget> {
  Map<String, int> rankings = {}; // Stocke le classement de chaque élément

  @override
  void initState() {
    super.initState();
    // Initialiser tous les éléments avec des valeurs par défaut
    rankings = Map.fromIterable(widget.question.rankingOptions!.keys,key: (k) => k,value: (v) => 1,);
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ...widget.question.rankingOptions!.keys.map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(option, style: TextStyle(fontSize: 16)),
                  SizedBox(width: 20),
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
          }).toList(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => widget.onSubmit(rankings),
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}

