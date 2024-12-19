import 'package:flutter/material.dart';
import '../../../Model/models/question.dart';

class RankingQuestionWidget extends StatefulWidget {
  final Question question;
  final Function(List<String>) onSubmit; // Format attendu : ['Jupiter: 1', ...]

  RankingQuestionWidget({required this.question, required this.onSubmit});

  @override
  _RankingQuestionWidgetState createState() => _RankingQuestionWidgetState();
}

class _RankingQuestionWidgetState extends State<RankingQuestionWidget> {
  late Map<String, int> rankings;

  @override
  void initState() {
    super.initState();
    // Initialiser les classements avec des valeurs uniques
    int initialRank = 1;
    rankings = {
      for (var option in widget.question.rankingOptions!.keys) option: initialRank++
    };
  }

  void _updateRankings(String option, int newValue) {
    setState(() {
      // Trouver quelle option possède déjà cette valeur
      String? conflictingOption = rankings.keys.firstWhere(
        (key) => rankings[key] == newValue && key != option,
        orElse: () => "",
      );

      // Si une option est en conflit, on la décale
      if (conflictingOption != null) {
        rankings[conflictingOption] = rankings[option]!; // Swap les valeurs
      }

      // Met à jour le classement pour l'option courante
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
          // Génération dynamique des options
          ...rankings.keys.map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(option, style: TextStyle(fontSize: 16)),
                  SizedBox(width: 20),
                  DropdownButton<int>(
                    value: rankings[option],
                    items: List.generate(
                      rankings.length,
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
            onPressed: () {
              // Transformer le Map en format attendu : ['Jupiter: 1', 'Saturne: 2', ...]
              List<String> formattedRanking = rankings.entries
                  .map((entry) => '${entry.key}: ${entry.value}') // Retirer les guillemets inutiles
                  .toList();
              widget.onSubmit(formattedRanking); // Soumettre la liste formatée
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}



