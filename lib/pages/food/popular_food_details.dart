import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/popular_product_controller.dart';
import 'package:food_delivery_app/home/main_food_page.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/color.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
 final int pageId;
   const PopularFoodDetails({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product=Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(Get.find<CartController>());



    print("page id is"+" "+pageId.toString());
    print("product name is "+" "+ product.name.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
        //Background Image
         Positioned(
           left: 0,
           right: 0,
           child: Container(

             width: double.maxFinite,
             height: Dimensions.popularFoodSize,
             decoration: BoxDecoration(
               color: Colors.redAccent,
               image: DecorationImage(
                  fit: BoxFit.cover,
                 image:NetworkImage(
                   AppConstant.BASE_URL+AppConstant.UPLOAD_URL+product.img!
                 )
               ),
             ),
           ),
         ),
          //app icon widget
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
              right: Dimensions.width20,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                    GestureDetector(

                      child: AppIcon(
                        icon:Icons.arrow_back_ios,

                      ),
                      onTap: (){
                        Get.to(()=>MainFoodPage());
                      },
                    ),
                  AppIcon(
                      icon:Icons.shopping_cart_outlined)
                ],
              )),
          //introduction widget
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodSize-20,
              child:Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    AppColum(text: product.name!),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduction"),
                    SizedBox(height: Dimensions.height20,),
                     
                     Expanded(
                       child: SingleChildScrollView(
                       child: ExpandableTextWidget(
                            text: product.description!,
                            ),
                    // ),

                       ),
                     )],
                )


              ) ),

          //Expandable text widgets


        ],

      ),
      //buttom Navigastion item
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){

        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height30,
              bottom: Dimensions.height30
          ),

          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20)
              )
          ),
          //button
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20,
                    bottom: Dimensions.height20
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap:(){
                          popularProduct.setQuantity(false);
                          popularProduct.quantity;
                        },
                        child: Icon(Icons.remove,color: AppColors.signColor,)),

                    SizedBox(width: Dimensions.widtht10/2,),
                    BigText(text: popularProduct.quantity.toString()),
                    SizedBox(width: Dimensions.widtht10/2,),
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(true);
                      },
                        child: Icon(Icons.add,color: AppColors.signColor,)),
                  ],
                ),
              ),
        // GetBuilder<CartController>(builder: (cartController){
        //       return GestureDetector(
        //         onTap: (){
        //          var value= cartController.addItem(popularProduct.quantity);
        //           print("value is $value");
        //         },
        //         behavior: HitTestBehavior.translucent,
        //         child:
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,

                  ),
                  child: GestureDetector(
                      onTap: (){
                        popularProduct.addItem(product);
                      },

                      child: BigText(text: "\$${product.price!}| Add to cart",color: Colors.white)),
                ),
        //       );
        // })

            ],
          ),
        );
    }),
    );
  }
}
