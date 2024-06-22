class Option {
  final int id;
  final String optionText;
  final String? shortDescription;
  final String? media;
  final int votes;

  Option({
    required this.id,
    required this.optionText,
    this.shortDescription,
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
