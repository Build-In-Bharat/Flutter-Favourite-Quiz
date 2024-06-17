// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfQuestions: (json['number_of_questions'] as num).toInt(),
      wasPublishedRecently: json['was_published_recently'] as bool,
      views: (json['views'] as num).toInt(),
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'questions': instance.questions,
      'number_of_questions': instance.numberOfQuestions,
      'was_published_recently': instance.wasPublishedRecently,
      'views': instance.views,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: (json['id'] as num).toInt(),
      questionText: json['question_text'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      views: (json['views'] as num).toInt(),
      votes: (json['votes'] as num).toInt(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'question_text': instance.questionText,
      'options': instance.options,
      'views': instance.views,
      'votes': instance.votes,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      id: (json['id'] as num).toInt(),
      optionText: json['option_text'] as String,
      shortDescription: json['short_description'] as String?,
      media: json['media'],
      votes: (json['votes'] as num).toInt(),
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'option_text': instance.optionText,
      'short_description': instance.shortDescription,
      'media': instance.media,
      'votes': instance.votes,
    };
