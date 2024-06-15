class Quiz {
  final int id;
  final String title;
  final List<Question> questions;

  Quiz({
    required this.id,
    required this.title,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    var list = json['questions'] as List;
    List<Question> questionList =
        list.map((i) => Question.fromJson(i)).toList();

    return Quiz(
      id: json['id'],
      title: json['title'],
      questions: questionList,
    );
  }
}

class Question {
  final int id;
  final String questionText;
  final List<Option> options;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var list = json['options'] as List;
    List<Option> optionList = list.map((i) => Option.fromJson(i)).toList();

    return Question(
      id: json['id'],
      questionText: json['question_text'],
      options: optionList,
    );
  }
}

class Option {
  final int id;
  final String optionText;
  final String shortDescription;
  final String? media;
  final int votes;

  Option({
    required this.id,
    required this.optionText,
    required this.shortDescription,
    this.media,
    required this.votes,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      optionText: json['option_text'],
      shortDescription: json['short_description'],
      media: json['media'],
      votes: json['votes'],
    );
  }
}
