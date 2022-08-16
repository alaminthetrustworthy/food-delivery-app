import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/repository/cart_repo.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});


//store all of our items in this map and check if the
// corresponding key or productId exist in the map and update it with new one
  Map<int, CartModel> _itemMap={};



  //Add item item method
  void addItem(ProductModel productModel,int quantity){
      _itemMap.putIfAbsent(productModel.id!, () {

        print("adding item to cart id ${productModel.id!} $quantity");

        return CartModel(
            id: productModel.id!,
            name: productModel.name,
            price: productModel.price,
            img: productModel.img,
            quantity: quantity,
            time: DateTime.now().toString(),
            isExist: true
        );
      });
      }
      //existInCart method is a method that check for the corresponding
// key or productId exist in the items map if it exist it return true else it return false

      existInCart(ProductModel productModel){
        if((productModel.id!)==_itemMap.keys){
          return true;
         
        }
      }


    }

