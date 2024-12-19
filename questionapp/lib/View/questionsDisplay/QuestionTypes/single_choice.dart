import 'package:flutter/material.dart';
import '../../../Model/models/Question.dart';

class SingleChoiceWidget extends StatefulWidget {
  final Question question;
  final Function(String) onSubmit; // Format attendu : Une seule option sélectionnée

  SingleChoiceWidget({required this.question, required this.onSubmit});

  @override
  _SingleChoiceWidgetState createState() => _SingleChoiceWidgetState();
}

class _SingleChoiceWidgetState extends State<SingleChoiceWidget> {
  // Option actuellement sélectionnée
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    if (widget.question.options == null || widget.question.options!.isEmpty) {
      return Center(child: Text("No options available"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            widget.question.questionText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        ...widget.question.options!.map((option) {
          return Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: option,
                    groupValue: selectedOption, // La valeur sélectionnée
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value; // Met à jour l'option sélectionnée
                        print("Selected Option: $selectedOption");
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      option,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: selectedOption != null
                ? () => widget.onSubmit(selectedOption!) // Envoie l'option sélectionnée
                : null, // Désactiver si aucune option n'est sélectionnée
            child: Text("Submit"),
          ),
        ),
      ],
    );
  }
}
