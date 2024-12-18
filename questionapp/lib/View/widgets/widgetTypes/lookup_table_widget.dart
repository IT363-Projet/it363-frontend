import 'package:flutter/material.dart';
import '../../../Model/models/question.dart';

class LookupTableWidget extends StatefulWidget {
  final Question question;
  final Function(List<String>) onSubmit;

  LookupTableWidget({required this.question, required this.onSubmit});

  @override
  _LookupTableWidgetState createState() => _LookupTableWidgetState();
}

class _LookupTableWidgetState extends State<LookupTableWidget> {
  final List<String> selectedAnswers = []; // Liste des options sélectionnées

  @override
  Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center( // Centrer la question
        child: Text(
          widget.question.questionText,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 20),
      Center( // Centrer le tableau
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600), // Largeur maximale de 600 pixels
          child: Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1),
            },
            children: [
              // En-têtes du tableau
              TableRow(
                children: widget.question.columns!.map(
                  (col) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        col,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ).toList(),
              ),
              // Lignes des données
              ...widget.question.tableData!.map(
                (row) {
                  final option = row["Option"]!; // Nom de la planète
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
      Center(
      child: ElevatedButton(
        onPressed: selectedAnswers.isNotEmpty
            ? () => widget.onSubmit(selectedAnswers)
            : null,
        child: Text("Submit"),
      ),
    ),
    ],
  );
}
  
}

