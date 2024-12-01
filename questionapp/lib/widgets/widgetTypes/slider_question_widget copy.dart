// chemin lib/widgets/widgetTypes/slider_question_widget.dart

import 'package:flutter/material.dart';
import '../../models/question.dart';

class SliderQuestionWidget extends StatefulWidget {
  final Question question;
  final Function(int) onSubmit;

  const SliderQuestionWidget({Key? key, required this.question, required this.onSubmit}) : super(key: key);

  @override
  _SliderQuestionWidgetState createState() => _SliderQuestionWidgetState();
}

class _SliderQuestionWidgetState extends State<SliderQuestionWidget> {
    double sliderValue = 6;
   
    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Center(
                child : Text(
                      widget.question.questionText,
                      style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                Center( // Centrer le slider
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300), // Largeur maximale du slider
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
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => widget.onSubmit(sliderValue.round()),
                    child: const Text("Submit"),
                  ),
                ),
            ],
        );
    }
}
