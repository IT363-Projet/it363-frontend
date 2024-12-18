// chemin lib/widgets/QuestionWidget.dart

import 'package:flutter/material.dart';
import 'package:questionapp/View/widgets/widgetTypes/slider_question_widget%20copy.dart';
import '../../Model/models/question.dart';
import 'widgetTypes/multiple_choice_widget.dart';
import 'widgetTypes/drop_down_question_widget.dart';
import 'widgetTypes/ranking_question_widget.dart';
import 'widgetTypes/lookup_table_widget.dart';
import 'widgetTypes/image_choice_widget.dart';

class QuestionWidget<T> extends StatelessWidget {
  final Question question;
  final void Function(T) onSubmit; // Utilise un type générique T pour onSubmit

  QuestionWidget({required this.question, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    switch (question.questionType) {
      case 'multiple_choice':
        return MultipleChoiceWidget(
            question: question,
            onSubmit: (selectedOption) => onSubmit(selectedOption as T));
      case 'slider':
        return SliderQuestionWidget(
            question: question,
            onSubmit: (sliderValue) => onSubmit(sliderValue as T));
      case 'ranking':
        return RankingQuestionWidget(
            question: question, onSubmit: (ranking) => onSubmit(ranking as T));
      case 'lookup_table':
        return LookupTableWidget(
          question: question,
          onSubmit: (selectedOptions) => onSubmit(selectedOptions as T),
        );
      case 'image_choice':
        return ImageChoiceWidget(
          question: question,
          onSubmit: (selectedImage) => onSubmit(selectedImage as T),
        );
      case 'dropdown':
        return DropdownQuestionWidget(
          question: question,
          onSubmit: (selectedOption) => onSubmit(selectedOption as T),
        );
      default:
        return Center(
          child: Text("Unknown question type"),
        );
    }
  }
}

