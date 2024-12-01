import 'package:flutter/material.dart';
import '../../models/question.dart';

class LookupTableWidget extends StatefulWidget {
  final Question question;
  final Function(List<String>) onSubmit;

  const LookupTableWidget({Key? key, required this.question, required this.onSubmit}) : super(key: key);

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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 20),
      Center( // Centrer le tableau
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600), // Largeur maximale de 600 pixels
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
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      Center(
      child: ElevatedButton(
        onPressed: selectedAnswers.isNotEmpty
            ? () => widget.onSubmit(selectedAnswers)
            : null,
        child: const Text("Submit"),
      ),
    ),
    ],
  );
}
  
}

