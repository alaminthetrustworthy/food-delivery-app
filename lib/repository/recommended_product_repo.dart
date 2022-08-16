import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:get/get.dart';

import '../utils/app_constant.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstant.RECOMMENDED_PRODUCT);

  }

}