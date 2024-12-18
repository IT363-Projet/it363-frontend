import 'package:flutter/material.dart';
import '../../../Model/models/question.dart';

class SliderQuestionWidget extends StatefulWidget {
  final Question question;
  final Function(int) onSubmit;

  SliderQuestionWidget({required this.question, required this.onSubmit});

  @override
  _SliderQuestionWidgetState createState() => _SliderQuestionWidgetState();
}

class _SliderQuestionWidgetState extends State<SliderQuestionWidget> {
  late double sliderValue;

  @override
  void initState() {
    super.initState();
    // Initialisation de la valeur du slider
    sliderValue = widget.question.minValue!.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            widget.question.questionText,
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(height: 20),
        Center( // Centrer le slider
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300), // Largeur maximale du slider
            child: Slider(
              value: sliderValue,
              min: widget.question.minValue!.toDouble(),
              max: widget.question.maxValue!.toDouble(),
              divisions: widget.question.maxValue! - widget.question.minValue!,
              label: sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () => widget.onSubmit(sliderValue.round()),
            child: Text("Submit"),
          ),
        ),
      ],
    );
  }
}
