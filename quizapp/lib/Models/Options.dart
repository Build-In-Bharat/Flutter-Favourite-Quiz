class Options {
  int id;
  String optionText;
  String? shortDescription;
  String? media;
  int votes;

  Options({
    required this.id,
    required this.optionText,
    required this.shortDescription,
    required this.media,
    required this.votes,
  });

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      id: json['id'],
      optionText: json['option_text'],
      shortDescription: json['short_description'],
      media: json['media'],
      votes: json['votes'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "option_text": optionText,
        "short_description": shortDescription,
        "media": media,
        "votes": votes,
      };
}
