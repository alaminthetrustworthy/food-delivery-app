import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/recommened_product_controller.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/repository/cart_repo.dart';
import 'package:food_delivery_app/repository/popular_product_repo.dart';
import 'package:food_delivery_app/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:get/get.dart';

import '../controller/popular_product_controller.dart';

Future<void> init()async {
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstant.BASE_URL));
  //repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(),fenix: true);
  //Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  //Get.put(CartController(cartRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()),fenix: true);
}