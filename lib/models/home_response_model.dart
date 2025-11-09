// lib/models/home_response.dart
import 'package:e_commerce_app/models/feature_product_model.dart';

import 'banner_model.dart';
import 'specials_model.dart';
import 'category_model.dart';

class HomeResponse {
  final List<BannerModel> banners;
  final List<SpecialsModel> specials;
  final List<CategoriesModel> categories;
  final List<FeaturedProductsModel> featuredProducts;
  final List<FeaturedProductsModel> products;

  HomeResponse({
    required this.banners,
    required this.specials,
    required this.categories,
    required this.featuredProducts,
    required this.products,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      banners: (json['banners'] as List)
          .map((e) => BannerModel.fromJson(e))
          .toList(),
      specials: (json['specials'] as List)
          .map((e) => SpecialsModel.fromJson(e))
          .toList(),
      categories: (json['categories'] as List)
          .map((e) => CategoriesModel.fromJson(e))
          .toList(),
      featuredProducts: (json['featured_products'] as List)
          .map((e) => FeaturedProductsModel.fromJson(e))
          .toList(),
      products: (json['products'] as List)
          .map((e) => FeaturedProductsModel.fromJson(e))
          .toList(),
    );
  }
}
