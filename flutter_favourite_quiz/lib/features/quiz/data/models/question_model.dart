import 'dart:convert';

import 'package:flutter_favourite_quiz/features/quiz/data/models/option_model.dart';

// QuestionModel class
class QuestionModel {
  int id;
  String questionText;
  List<Option> options;
  int views;
  int votes;

  QuestionModel({
    required this.id,
    required this.questionText,
    required this.options,
    required this.views,
    required this.votes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question_text': questionText,
      'options': options.map((x) => x.toMap()).toList(),
      'views': views,
      'votes': votes,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'] as int,
      questionText: map['question_text'] as String,
      options: List<Option>.from(
        (map['options'] as List<dynamic>).map<Option>(
          (x) => Option.fromMap(x as Map<String, dynamic>),
        ),
      ),
      views: map['views'] as int,
      votes: map['votes'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
