// chemin lib/widgets/widgetTypes/multiple_choice_widget.dart
import 'package:flutter/material.dart';
import '../../models/question.dart';

class MultipleChoiceWidget extends StatefulWidget {
  final Question question;
  final Function(String) onSubmit;

  const MultipleChoiceWidget({Key? key, required this.question, required this.onSubmit}) : super(key: key);

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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        ...widget.question.options!.map((option) {
          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300), // Limite la largeur
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
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: selectedOption != null
                ? () => widget.onSubmit(selectedOption!)
                : null,
            child: const Text("Submit"),
          ),
        ),
      ],
    );
  }
}

