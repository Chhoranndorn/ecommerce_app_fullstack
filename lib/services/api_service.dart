// lib/services/api_service.dart
import 'package:dio/dio.dart';
import 'package:e_commerce_app/models/home_response_model.dart';

class ApiService {
  // Singleton pattern
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  late final Dio dio;

  ApiService._internal() {
    dio = Dio(
      BaseOptions(
        // baseUrl: 'http://127.0.0.1:8000',
        baseUrl: 'http://10.0.2.2:8000/api', // instead of 127.0.0.1
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  // Example: GET request
  Future<Response> getPosts() async {
    return await dio.get('/posts');
  }

  // Example: POST request
  Future<Response> createPost(Map<String, dynamic> data) async {
    return await dio.post('/posts', data: data);
  }

  Future<HomeResponse> getHomeData() async {
    print("Getting home data from API...");
    final response = await dio.get('/home');
    return HomeResponse.fromJson(response.data);
  }
}
