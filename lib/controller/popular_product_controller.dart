import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/repository/popular_product_repo.dart';
import 'package:food_delivery_app/utils/color.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList => _popularProductList;

  //instanciating cart controller
  late CartController _cartController;
  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;

  int _inCartItem=0;
  int get inCartItem=>_inCartItem+_quantity;

  Future<void>  getPopularProductList() async {
      Response response=await popularProductRepo.getPopularProductList();
     // print("current status code"+response.statusCode.toString());
     // print("status text is"+" "+response.statusText.toString());
    if(response.statusCode==200 || response.statusCode==201){
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);

        print("got products !!!");
        _isLoaded=true;
       // print(_popularProductList);
      update();
    }else{
      print("not gotten");
    }
  }
  void setQuantity(bool isIncrement){
    if(isIncrement){
      //print("Incremented");
      _quantity=checkQuantity(_quantity+1);
    }else{
      _quantity=checkQuantity(_quantity-1);
      print("decremented");
    }
    update();
  }
  int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("item count", "you cant reduce less then 0",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white
      );

      return 0;
    }else if(quantity>20){
      Get.snackbar("You exceed limit", "you can't other more than 20"
      ,backgroundColor: AppColors.mainColor);
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct(CartController cart){
    _quantity=0;
    _inCartItem=0;

    _cartController=cart;
  }

  void addItem(ProductModel productModel){
    _cartController.addItem(productModel, _quantity);
  }

}