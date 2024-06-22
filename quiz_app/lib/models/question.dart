import 'option.dart';

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
      questionText: json['question_text'],
      options: (json['options'] as List)
          .map((option) => Option.fromJson(option))
          .toList(),
      views: json['views'],
      votes: json['votes'],
    );
  }
}
