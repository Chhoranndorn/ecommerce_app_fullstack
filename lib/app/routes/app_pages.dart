import 'package:get/get.dart';

import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/categories/bindings/categories_binding.dart';
import '../modules/categories/views/categories_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/drawer/bindings/drawer_binding.dart';
import '../modules/drawer/views/drawer_view.dart';
import '../modules/favorites/bindings/favorites_binding.dart';
import '../modules/favorites/views/favorites_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  // static const INITIAL = Routes.LOGIN;
  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
        name: Routes.LOGIN, page: () => LoginView(), binding: LoginBinding()),
    GetPage(
        name: Routes.SIGNUP,
        page: () => SignupView(),
        binding: SignupBinding()),
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () =>  DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => const CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER,
      page: () => const DrawerView(),
      binding: DrawerBinding(),
    ),
  ];
}
