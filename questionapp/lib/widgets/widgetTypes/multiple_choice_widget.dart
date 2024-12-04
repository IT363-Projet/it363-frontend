// chemin lib/widgets/widgetTypes/multiple_choice_widget.dart
import 'package:flutter/material.dart';
import '../../models/question.dart';

class MultipleChoiceWidget extends StatefulWidget {
  final Question question;
  final Function(String) onSubmit;

  MultipleChoiceWidget({required this.question, required this.onSubmit});

  @override
  _MultipleChoiceWidgetState createState() => _MultipleChoiceWidgetState();
}

class _MultipleChoiceWidgetState extends State<MultipleChoiceWidget> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Centrer tout le contenu
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
              constraints: BoxConstraints(maxWidth: 300), // Limite la largeur
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: option,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                  Expanded( // Utilisation d'un Expanded pour aligner le texte
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
                ? () => widget.onSubmit(selectedOption!)
                : null,
            child: Text("Submit"),
          ),
        ),
      ],
    );
  }
}

