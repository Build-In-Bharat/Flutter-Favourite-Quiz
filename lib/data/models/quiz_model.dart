class QuizModel {
  int? id;
  String? title;
  List<Questions>? questions;
  int? numberOfQuestions;
  bool? wasPublishedRecently;
  int? views;

  QuizModel(
      {this.id,
      this.title,
      this.questions,
      this.numberOfQuestions,
      this.wasPublishedRecently,
      this.views});

  QuizModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
    numberOfQuestions = json['number_of_questions'];
    wasPublishedRecently = json['was_published_recently'];
    views = json['views'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    data['number_of_questions'] = numberOfQuestions;
    data['was_published_recently'] = wasPublishedRecently;
    data['views'] = views;
    return data;
  }
}

class Questions {
  int? id;
  String? questionText;
  List<Options>? options;
  int? views;
  int? votes;

  Questions({this.id, this.questionText, this.options, this.views, this.votes});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['question_text'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    views = json['views'];
    votes = json['votes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question_text'] = questionText;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['views'] = views;
    data['votes'] = votes;
    return data;
  }
}

class Options {
  int? id;
  String? optionText;
  String? shortDescription;
  String? media;
  int? votes;

  Options(
      {this.id,
      this.optionText,
      this.shortDescription,
      this.media,
      this.votes});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    optionText = json['option_text'];
    shortDescription = json['short_description'];
    media = json['media'];
    votes = json['votes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['option_text'] = optionText;
    data['short_description'] = shortDescription;
    data['media'] = media;
    data['votes'] = votes;
    return data;
  }
}
