// modal class representing a quiz
class Quiz {
  final int id;
  final String title;
  final int numberOfQuestions;
  bool isFavourite;

  Quiz({
    required this.id,
    required this.title,
    required this.numberOfQuestions,
    this.isFavourite = false,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      title: json['title'],
      numberOfQuestions: json['questions'].length,
    );
  }
}
