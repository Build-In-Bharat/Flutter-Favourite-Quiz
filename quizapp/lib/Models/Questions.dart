import 'package:quizapp/Models/Options.dart';

class Question {
  int id;
  String questionText;
  int views;
  int votes;
  List<Options> options;

  Question({
    required this.id,
    required this.questionText,
    required this.views,
    required this.votes,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      questionText: json['question_text'],
      views: json['views'],
      votes: json['votes'],
      options:
          List<Options>.from(json['options'].map((e) => Options.fromJson(e))),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "question_text": questionText,
        "views": views,
        "votes": votes,
        "options": List<dynamic>.from(options.map((e) => e.toJson())),
      };
}
