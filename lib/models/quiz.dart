import 'package:json_annotation/json_annotation.dart';

part 'quiz.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Quiz {
  int id;
  String title;
  List<Question> questions;
  int numberOfQuestions;
  bool wasPublishedRecently;
  int views;

  Quiz({
    required this.id,
    required this.title,
    required this.questions,
    required this.numberOfQuestions,
    required this.wasPublishedRecently,
    required this.views,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Question {
  int id;
  String questionText;
  List<Option> options;
  int views;
  int votes;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.views,
    required this.votes,
  });
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Option {
  int id;
  String optionText;
  String? shortDescription;
  dynamic media;
  int votes;

  Option({
    required this.id,
    required this.optionText,
    required this.shortDescription,
    required this.media,
    required this.votes,
  });
  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
