import 'package:quizapp/Classes/Questions.dart';

class QuizDetail {
  late int id;
  late String title;
  late int numberOfQuestions;
  late List<Question> questions;

  QuizDetail({
    required this.id,
    required this.numberOfQuestions,
    required this.title,
    required this.questions,
  });

  factory QuizDetail.fromJson(Map<String, dynamic> json) {
    return QuizDetail(
      id: json['id'],
      numberOfQuestions: json['number_of_questions'],
      title: json['title'],
      questions: List<Question>.from(
          json['questions'].map((e) => Question.fromJson(e))),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "number_of_questions": numberOfQuestions,
        "title": title,
        "questions": List<dynamic>.from(questions.map((e) => e.toJson())),
      };
}
