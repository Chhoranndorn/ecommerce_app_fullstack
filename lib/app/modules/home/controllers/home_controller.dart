import 'package:e_commerce_app/models/home_response_model.dart';
import 'package:e_commerce_app/services/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiService apiService = ApiService();

  bool isLoading = false;
  HomeResponse? homeData;

  @override
  void onInit() {
    super.onInit();
    // fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    print("Fetching home data...");
    try {
      isLoading = true;
      homeData = await apiService.getHomeData();
    } catch (e) {
      print('Error fetching home data: $e');
    } finally {
      isLoading = false;
    }
  }
}
