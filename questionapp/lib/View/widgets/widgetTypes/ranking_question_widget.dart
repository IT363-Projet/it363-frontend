import 'package:flutter/material.dart';
import '../../../Model/models/question.dart';

// Définition de la classe principale RankingQuestionWidget, un StatefulWidget.
class RankingQuestionWidget extends StatefulWidget {
  // Propriété : Une question de type `Question`, contenant les options de classement.
  final Question question;

  // Propriété : Une fonction de callback qui renvoie les résultats sous forme de Map.
  final Function(Map<String, int>) onSubmit;

  // Constructeur : Prend en paramètres la question et la fonction de soumission.
  RankingQuestionWidget({required this.question, required this.onSubmit});

  // Méthode pour créer l'état mutable(dynamique) associé à ce widget.
  @override
  _RankingQuestionWidgetState createState() => _RankingQuestionWidgetState();
}

class _RankingQuestionWidgetState extends State<RankingQuestionWidget> {
  // Map pour stocker les classements des options.
  Map<String, int> rankings = {};

  // Méthode appelée au moment de l'initialisation de l'état.
  @override
  void initState() {
    super.initState();
    // Initialisation des valeurs de classement avec 1 par défaut pour chaque option.
    rankings = Map.fromIterable(
      widget.question.rankingOptions!.keys,
      key: (k) => k, // La clé reste l'option.
      value: (v) => 1, // La valeur par défaut est 1.
    );
  }

  // Méthode pour mettre à jour les valeurs des classements.
  // Ajuste les classements pour éviter les doublons.
  void _updateRankings(String option, int newValue) {
    setState(() {
      // Trouve si une autre option a déjà le même classement (newValue).
      String existingOption = rankings.keys.firstWhere(
        (key) => rankings[key] == newValue,
        orElse: () => "",
      );

      // Si une option existe avec la même valeur, échange les valeurs.
      if (existingOption != null) {
        rankings[existingOption] = rankings[option]!;
      }

      // Met à jour la valeur de classement pour l'option actuelle.
      rankings[option] = newValue;
    });
  }

  // Méthode build : génère l'interface utilisateur pour ce widget.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centre les enfants verticalement.
        children: [
          // Affiche le texte de la question.
          Text(
            widget.question.questionText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Génération dynamique des widgets pour chaque option.
          ...widget.question.rankingOptions!.keys.map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Taille minimale pour la ligne.
                mainAxisAlignment: MainAxisAlignment.center, // Centre le contenu.
                children: [
                  // Affiche le nom de l'option.
                  Text(option, style: TextStyle(fontSize: 16)),
                  SizedBox(width: 20),
                  // DropdownButton pour choisir un classement (1 à 4).
                  DropdownButton<int>(
                    value: rankings[option], // Classement actuel de l'option.
                    items: List.generate(
                      4,
                      (index) => DropdownMenuItem(
                        value: index + 1, // Valeurs possibles : 1, 2, 3, 4.
                        child: Text((index + 1).toString()), // Texte de l'item.
                      ),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        // Met à jour le classement lorsque l'utilisateur choisit une nouvelle valeur.
                        _updateRankings(option, value);
                      }
                    },
                  ),
                ],
              ),
            );
          }).toList(), // Convertit l'itération en une liste de widgets.
          SizedBox(height: 20),
          // Bouton pour soumettre les classements.
          ElevatedButton(
            onPressed: () => widget.onSubmit(rankings), // Appelle la fonction onSubmit.
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}

