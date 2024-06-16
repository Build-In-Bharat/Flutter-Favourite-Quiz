import 'package:flutter/foundation.dart';

class Quiz {
  final int id;
  final String title;
  final List<Question> questions;
  final int numberOfQuestions;
  final bool wasPublishedRecently;
  final int views;

  Quiz({
    required this.id,
    required this.title,
    required this.questions,
    required this.numberOfQuestions,
    required this.wasPublishedRecently,
    required this.views,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      title: json['title'],
      questions: (json['questions'] as List? ?? [])
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(),
      numberOfQuestions: json['number_of_questions'] ?? 0,
      wasPublishedRecently: json['was_published_recently'] ?? false,
      views: json['views'] ?? 0,
    );
  }
}

class Question {
  final int id;
  final String questionText;
  final List<Option> options;
  final int views;
  final int votes;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.views,
    required this.votes,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      questionText: json['question_text'] ?? '',
      options: (json['options'] as List? ?? [])
          .map((optionJson) => Option.fromJson(optionJson))
          .toList(),
      views: json['views'] ?? 0,
      votes: json['votes'] ?? 0,
    );
  }
}

class Option {
  final int id;
  final String optionText;
  final String shortDescription;
  final dynamic media;
  final int votes;

  Option({
    required this.id,
    required this.optionText,
    required this.shortDescription,
    required this.media,
    required this.votes,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      optionText: json['option_text'] ?? '',
      shortDescription: json['short_description'] ?? '',
      media: json['media'],
      votes: json['votes'] ?? 0,
    );
  }
}
