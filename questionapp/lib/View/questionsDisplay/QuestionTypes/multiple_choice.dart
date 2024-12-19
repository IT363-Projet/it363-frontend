import 'package:flutter/material.dart';
import '../../../Model/models/Question.dart';

class MultipleChoiceWidget extends StatefulWidget {
  final Question question;
  final Function(List<String>) onSubmit;

  MultipleChoiceWidget({required this.question, required this.onSubmit});

  @override
  _LookupTableWidgetState createState() => _LookupTableWidgetState();
}

class _LookupTableWidgetState extends State<MultipleChoiceWidget> {
  final List<String> selectedAnswers = []; // Liste des options sélectionnées

  @override
  Widget build(BuildContext context) {
    if (widget.question.tableData == null || widget.question.columns == null) {
      return Center(
        child: Text(
          "Invalid question format for lookup_table.",
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            widget.question.questionText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
              },
              children: [
                // En-tête du tableau
                TableRow(
                  children: widget.question.columns!.map(
                    (col) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          col,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ).toList(),
                ),
                // Lignes des données
                ...widget.question.tableData!.map(
                  (row) {
                    final option = row["Option"]!; // Extraire le texte de l'option
                    final isSelected = selectedAnswers.contains(option);

                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(option),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedAnswers.add(option);
                                } else {
                                  selectedAnswers.remove(option);
                                }
                              });
                              print("Selected Options: $selectedAnswers");
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ).toList(),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: selectedAnswers.isNotEmpty
              ? () => widget.onSubmit(selectedAnswers)
              : null,
          child: Text("Submit"),
        ),
      ],
    );
  }
}


