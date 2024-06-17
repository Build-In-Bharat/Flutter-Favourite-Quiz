import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://core.id8devhub.com/api/v1/quizzes/';

  Future<List<Map<String, dynamic>>> fetchQuizzes() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        return body.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load quizzes');
      }
    } on SocketException catch (e) {
      throw Exception('No Internet connection: $e');
    } on http.ClientException catch (e) {
      throw Exception('Failed to connect to the server: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
