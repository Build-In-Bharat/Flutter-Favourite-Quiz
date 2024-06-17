import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String BASE_URL = "https://core.id8devhub.com/api/v1";

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = BASE_URL;
    _dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
  }

  Dio get sendRequest => _dio;
}

class ApiResponse {
  dynamic data;
  ApiResponse({required this.data});

  factory ApiResponse.fromResponse(Response response) {
    
    return ApiResponse(data: response);
    
  }
}
