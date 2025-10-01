import 'package:dio/dio.dart';
import 'package:e_commerce_app/app/data/providers/models/category.dart';
import 'package:e_commerce_app/app/data/providers/models/product.dart';
import 'package:e_commerce_app/app/data/providers/models/special.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class HomeService{
  late final Dio _dio;

  HomeService() {

   _dio= Dio(BaseOptions(
    // baseUrl: "https://127.0.0.1:8000/api",
    // baseUrl: "https://10.0.2.2:8000/api",
    baseUrl: _getBaseUrl(),
    connectTimeout: const Duration(seconds:10),
    receiveTimeout:const Duration(seconds: 10),
    headers:{
      "Accept":"application/json",
    }
  ));
  }
    String _getBaseUrl() {
  if (GetPlatform.isAndroid) {
    print("onee");
    return "http://10.0.2.2/ecommerce_full_stack_api/public/api"; // Android emulator
  } else if (GetPlatform.isIOS) {
    print("twooo");
    return "http://127.0.0.1/ecommerce_full_stack_api/public/api"; // iOS simulator
  } else {
    print("threee");
    return "http://192.168.185.82/ecommerce_full_stack_api/public/api"; // Real device on LAN
  }
}
  Future<Map<String,dynamic>> fetchHomeData()async{
    try{
      final response = await _dio.get("/home");
      if(response.statusCode == 200){
       final data = response.data;
        // return response.data;
         return {
        "specials": (data["specials"] as List)
            .map((e) => Special.fromJson(e))
            .toList(),
        "categories": (data["categories"] as List)
            .map((e) => Category.fromJson(e))
            .toList(),
        "products": (data["products"] as List)
            .map((e) => Product.fromJson(e))
            .toList(),
      };
      }else{
        throw Exception("Failed to load data");
      }
    }catch(e){
      rethrow;
    }
  }
}