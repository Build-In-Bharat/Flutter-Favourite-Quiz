import 'dart:convert';

import 'package:flutter_favourite_quiz/features/quiz/data/models/question_model.dart';

// QuizModel class
class QuizModel {
  int id;
  String title;
  List<QuestionModel> questions;
  int numberOfQuestions;
  bool wasPublishedRecently;
  int views;
  // adding a new field to the model so that we can track the favourite quizzes
  bool isFavourite;

  QuizModel({
    required this.id,
    required this.title,
    required this.questions,
    required this.numberOfQuestions,
    required this.wasPublishedRecently,
    required this.views,
    this.isFavourite = false,
  });

  QuizModel copyWith({
    int? id,
    String? title,
    List<QuestionModel>? questions,
    int? numberOfQuestions,
    bool? wasPublishedRecently,
    int? views,
    bool? isFavourite,
  }) {
    return QuizModel(
      id: id ?? this.id,
      title: title ?? this.title,
      questions: questions ?? this.questions,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      wasPublishedRecently: wasPublishedRecently ?? this.wasPublishedRecently,
      views: views ?? this.views,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'number_of_questions': numberOfQuestions,
      'was_published_recently': wasPublishedRecently,
      'views': views,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] as int,
      title: map['title'] as String,
      questions: List<QuestionModel>.from(
        (map['questions'] as List<dynamic>).map<QuestionModel>(
          (x) => QuestionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      numberOfQuestions: map['number_of_questions'] as int,
      wasPublishedRecently: map['was_published_recently'] as bool,
      views: map['views'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
