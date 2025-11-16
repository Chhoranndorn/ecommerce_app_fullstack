// lib/services/api_service.dart
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/models/home_response_model.dart';

class ApiService {
  // Singleton pattern
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  late final Dio dio;

  ApiService._internal() {
    String host;
    if (Platform.isAndroid) {
      host = 'http://10.0.2.2:8000/api';
      // host = 'http://127.0.0.1:8000/api';
    } else if (Platform.isIOS) {
      host = 'http://127.0.0.1:8000/api';
    } else {
      host = 'http://192.168.0.152:8000/api';
    }
    dio = Dio(
      BaseOptions(
        // baseUrl: 'http://127.0.0.1:8000',
        // baseUrl: 'http://10.0.2.2:8000/api', // instead of 127.0.0.1
        baseUrl: host, // instead of 127.0.0.1
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
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
