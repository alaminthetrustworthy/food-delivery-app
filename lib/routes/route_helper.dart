import 'package:food_delivery_app/home/main_food_page.dart';
import 'package:food_delivery_app/pages/food/popular_food_details.dart';
import 'package:food_delivery_app/pages/food/recommended_food_detail.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';

class RoutesHelper{
  static const String initial="/";
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";
  static String getPopular(int pageId)=>"$popularFood?pageId=$pageId";
  static String getInitial()=>"$initial";
  static String getRecommendedFood(int pageId)=>"$recommendedFood?pageIdParam=$pageId";
  static List<GetPage> route=[
    GetPage(name: initial, page: ()=>MainFoodPage()),
    GetPage(name: popularFood, page: (){
      var pageId=Get.parameters['pageId'];
      return PopularFoodDetails(pageId:int.parse(pageId!));
  }),
    GetPage(name: recommendedFood, page: (){
      var pageId=Get.parameters['pageIdParam'];
      return RecommendedFoodDetail(pageId:int.parse(pageId!));
  }),

  ];
}