import 'package:flutter/material.dart';
import '../../models/question.dart';

class DropdownQuestionWidget extends StatefulWidget {
  final Question question;
  final Function(String) onSubmit;

  const DropdownQuestionWidget({Key? key, required this.question, required this.onSubmit}) : super(key: key);

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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        DropdownButton<String>(
          value: selectedOption,
          hint: const Text("Select an option"), // Placeholder initial
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
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: selectedOption != null ? () => widget.onSubmit(selectedOption!) : null,
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
