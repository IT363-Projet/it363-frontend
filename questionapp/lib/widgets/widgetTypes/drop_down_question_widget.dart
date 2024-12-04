import 'package:flutter/material.dart';
import '../../models/question.dart';

class DropdownQuestionWidget extends StatefulWidget {
  final Question question;
  final Function(String) onSubmit;

  DropdownQuestionWidget({required this.question, required this.onSubmit});

  @override
  _DropdownQuestionWidgetState createState() => _DropdownQuestionWidgetState();
}

class _DropdownQuestionWidgetState extends State<DropdownQuestionWidget> {
  String? selectedOption; // Option sélectionnée

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question.questionText,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        DropdownButton<String>(
          value: selectedOption,
          hint: Text("Select an option"), // Placeholder initial
          items: widget.question.dropdownOptions!.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: selectedOption != null ? () => widget.onSubmit(selectedOption!) : null,
          child: Text("Submit"),
        ),
      ],
    );
  }
}
