// chemin lib/widgets/QuestionWidget.dart

import 'package:flutter/material.dart';
import 'package:questionapp/View/questionsDisplay/QuestionTypes/slider_question_widget.dart';
import '../../Model/models/Question.dart';
import 'QuestionTypes/single_choice.dart';
import 'QuestionTypes/drop_down_question.dart';
import 'QuestionTypes/ranking_question.dart';
import 'QuestionTypes/multiple_choice.dart';
import 'QuestionTypes/image_choice.dart';

class QuestionWidget<T> extends StatelessWidget {
  final Question question;
  final void Function(T) onSubmit; // Utilise un type générique T pour onSubmit

  QuestionWidget({required this.question, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    switch (question.questionType) {
      case 'single_choice':
        return SingleChoiceWidget(
            question: question,
            onSubmit: (selectedOption) => onSubmit(selectedOption as T));
      case 'slider':
        return SliderQuestionWidget(
            question: question,
            onSubmit: (sliderValue) => onSubmit(sliderValue as T));
      case 'ranking':
        return RankingQuestionWidget(
            question: question, 
            onSubmit: (ranking) => onSubmit(ranking as T));
      case 'multiple_choice':
        return MultipleChoiceWidget(
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

