import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  final Dio dio = Dio(BaseOptions(
    baseUrl: "http://10.0.2.2:8000/api", // Android Emulator
    // baseUrl: "http://127.0.0.1:8000/api", // iOS Simulator
    // baseUrl: "http://<your_local_ip>:8000/api", // Real Device
    connectTimeout: Duration(seconds: 10),
  receiveTimeout: Duration(seconds: 10),
  headers: {
    "Accept": "application/json", // 👈 important
  },
  ));

  Future<Response> register(String name, String email, String password) async {
    return await dio.post('/register', data: {
      "name": name,
      "email": email,
      "password": password,
    });
  }

  Future<Response> login(String email, String password) async {
    final response = await dio.post('/login', data: {
      "email": email,
      "password": password,
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", response.data["token"]);

    dio.options.headers["Authorization"] = "Bearer ${response.data["token"]}";
    return response;
  }

  Future<Response> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    dio.options.headers["Authorization"] = "Bearer $token";
    final response = await dio.post('/logout');
    await prefs.remove("token");
    return response;
  }

  Future<Response> profile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    dio.options.headers["Authorization"] = "Bearer $token";
    return await dio.get('/profile');
  }
}
