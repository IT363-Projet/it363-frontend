// chemin lib/widgets/QuestionWidget.dart

import 'package:flutter/material.dart';
import 'package:questionapp/widgets/widgetTypes/slider_question_widget%20copy.dart';
import '../models/question.dart';
import 'widgetTypes/multiple_choice_widget.dart';
import 'widgetTypes/drop_down_question_widget.dart';
import 'widgetTypes/ranking_question_widget.dart';
import 'widgetTypes/lookup_table_widget.dart';
import 'widgetTypes/image_choice_widget.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function(dynamic) onSubmit; // Callback pour soumettre une réponse

  const QuestionWidget({Key? key, required this.question, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (question.questionType) {
      case 'multiple_choice':
        return MultipleChoiceWidget(
            question: question,
            onSubmit: (selectedOption) => onSubmit(selectedOption));
      case 'slider':
        return SliderQuestionWidget(
            question: question,
            onSubmit: (sliderValue) => onSubmit(sliderValue));
      case 'ranking':
        return RankingQuestionWidget(
            question: question, onSubmit: (ranking) => onSubmit(ranking));
      case 'lookup_table':
        return LookupTableWidget(
          question: question,
          onSubmit: (selectedOptions) => onSubmit(selectedOptions),
        );
      case 'image_choice':
        return ImageChoiceWidget(
          question: question,
          onSubmit: (selectedImage) => onSubmit(selectedImage),
        );
      case 'dropdown':
        return DropdownQuestionWidget(
          question: question,
          onSubmit: (selectedOption) => onSubmit(selectedOption),
        );
      default:
        return const Center(
          child: Text("Unknown question type"),
        );
    }
  }
}
