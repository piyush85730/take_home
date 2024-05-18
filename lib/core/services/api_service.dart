import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio()
    ..options.connectTimeout = const Duration(milliseconds: 5000)
    ..options.receiveTimeout = const Duration(milliseconds: 5000)
    ..options.sendTimeout = const Duration(milliseconds: 5000)
    ..options.baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.get(path, queryParameters: queryParams);
    return response;
  }

  Future<Response> deleteRequest({
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.delete(path, queryParameters: queryParams);
    return response;
  }
}
