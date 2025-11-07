import 'package:dio/dio.dart';
import 'package:e_commerce_app/app/data/providers/models/banner.dart';
import 'package:e_commerce_app/app/data/providers/models/category.dart';
import 'package:e_commerce_app/app/data/providers/models/product.dart';
import 'package:e_commerce_app/app/data/providers/models/special.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class HomeService {
  late final Dio _dio;

  HomeService() {
    _dio = Dio(BaseOptions(
        // baseUrl: "https://127.0.0.1:8000/api",
        // baseUrl: "https://10.0.2.2:8000/api",
        baseUrl: _getBaseUrl(),
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Accept": "application/json",
        }));
  }

  String _getBaseUrl() {
    if (GetPlatform.isAndroid) {
      print("Platform: Android");
      return "http://10.0.2.2:8000/api"; // Android emulator
    } else if (GetPlatform.isIOS) {
      print("Platform: iOS");
      return "http://127.0.0.1:8000/api"; // iOS simulator
    } else if (GetPlatform.isWeb) {
      print("Platform: Web");
      return "http://localhost:8000/api"; // Web browser
    } else {
      print("Platform: Physical Device");
      return "http://192.168.185.82:8000/api"; // Real device on LAN
    }
  }

  // Helper function to fix image URLs based on platform
  String _fixImageUrl(String url) {
    // For Web platform, keep localhost URLs as-is
    if (GetPlatform.isWeb && url.contains('localhost:8000')) {
      return url;
    }

    // If URL is already correct for the platform, return it
    if (GetPlatform.isAndroid && url.startsWith('http://10.0.2.2:8000/')) {
      return url;
    }
    if (GetPlatform.isIOS && url.startsWith('http://127.0.0.1:8000/')) {
      return url;
    }
    if (!GetPlatform.isAndroid &&
        !GetPlatform.isIOS &&
        !GetPlatform.isWeb &&
        url.startsWith('http://192.168.185.82:8000/')) {
      return url;
    }

    // Replace localhost:8000 with appropriate URL based on platform
    if (url.contains('localhost:8000')) {
      if (GetPlatform.isAndroid) {
        return url.replaceAll('localhost:8000', '10.0.2.2:8000');
      } else if (GetPlatform.isIOS) {
        return url.replaceAll('localhost:8000', '127.0.0.1:8000');
      } else if (GetPlatform.isWeb) {
        return url; // Keep localhost for web
      } else {
        return url.replaceAll('localhost:8000', '192.168.185.82:8000');
      }
    }

    // Fix malformed URLs like http://10.0.2.2/ecommerce_full_stack_api/public/storage/...
    // Extract the storage path and rebuild URL
    if (url.contains('/storage/')) {
      final storagePath = url.substring(url.indexOf('/storage/'));
      if (GetPlatform.isAndroid) {
        return 'http://10.0.2.2:8000$storagePath';
      } else if (GetPlatform.isIOS) {
        return 'http://127.0.0.1:8000$storagePath';
      } else if (GetPlatform.isWeb) {
        return 'http://localhost:8000$storagePath';
      } else {
        return 'http://192.168.185.82:8000$storagePath';
      }
    }

    return url;
  }

  Future<Map<String, dynamic>> fetchHomeData() async {
    try {
      final response = await _dio.get("/home");
      if (response.statusCode == 200) {
        final data = response.data;

        // Fix image URLs in the data
        final bannersList = (data["banners"] as List).map((e) {
          e['image'] = _fixImageUrl(e['image']);
          return Banner.fromJson(e);
        }).toList();

        final specialsList = (data["specials"] as List).map((e) {
          e['image'] = _fixImageUrl(e['image']);
          return Special.fromJson(e);
        }).toList();

        final categoriesList = (data["categories"] as List).map((e) {
          e['icon'] = _fixImageUrl(e['icon']);
          return Category.fromJson(e);
        }).toList();

        final featuredProductsList =
            (data["featured_products"] as List).map((e) {
          e['image'] = _fixImageUrl(e['image']);
          return Product.fromJson(e);
        }).toList();

        final productsList = (data["products"] as List).map((e) {
          e['image'] = _fixImageUrl(e['image']);
          return Product.fromJson(e);
        }).toList();

        return {
          "banners": bannersList,
          "specials": specialsList,
          "categories": categoriesList,
          "featured_products": featuredProductsList,
          "products": productsList,
        };
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      rethrow;
    }
  }
}
