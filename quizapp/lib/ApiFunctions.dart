import 'package:quizapp/Models/Quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<QuizDetail>> getQuiz() async {
  var url = Uri.parse('https://core.id8devhub.com/api/v1/quizzes/');
  var response = await http.get(url);
  var body = jsonDecode(response.body);

  List<QuizDetail>? data;
  data = <QuizDetail>[];

  body.forEach((e) {
    data!.add(QuizDetail.fromJson(e));
  });
  return data;
}
