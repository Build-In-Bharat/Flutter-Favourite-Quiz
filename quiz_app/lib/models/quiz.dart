import 'question.dart';

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
      questions: (json['questions'] as List)
          .map((question) => Question.fromJson(question))
          .toList(),
      numberOfQuestions: json['number_of_questions'],
      wasPublishedRecently: json['was_published_recently'],
      views: json['views'],
    );
  }
}
