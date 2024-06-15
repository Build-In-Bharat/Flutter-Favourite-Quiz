import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

// Option Model
class Option {
  int id;
  String optionText;
  String shortDescription;
  String media;
  int votes;
  Option({
    required this.id,
    required this.optionText,
    required this.shortDescription,
    required this.media,
    required this.votes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'option_text': optionText,
      'short_description': shortDescription,
      'media': media,
      'votes': votes,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      id: map['id'],
      optionText: map['option_text'] ?? "",
      shortDescription: map['short_description'] ?? "",
      media: map['media'] ?? "",
      votes: map['votes'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) =>
      Option.fromMap(json.decode(source) as Map<String, dynamic>);
}
