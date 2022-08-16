//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/color.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controller/recommened_product_controller.dart';
import '../../utils/app_constant.dart';
import '../../widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
 const RecommendedFoodDetail({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recommendedProduct=Get.find<RecommendedProductController>().recommendedProductList[pageId];
    print("recommended name is"+" "+recommendedProduct.name!);
    print("id is"+" "+pageId.toString());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
            SliverAppBar(
              toolbarHeight:60,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(

                    onTap:(){
                      Get.toNamed(RoutesHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear),
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height30),
              child: Container(


                 width: double.maxFinite,
                padding: EdgeInsets.only(top: Dimensions.height20/4,
                  bottom: Dimensions.height20/4
                ),
                child: Center(child: BigText(text: recommendedProduct.name!,size: Dimensions.font26,)),
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  )
                ),
              ),


              ),
              pinned: true,
              backgroundColor: AppColors.titleColor,
              expandedHeight: 200.00,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstant.BASE_URL+AppConstant.UPLOAD_URL+recommendedProduct.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text:recommendedProduct.description!,),
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backGroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),

                BigText(text: "\$ ${recommendedProduct.price!} "+"X "+"0",color: AppColors.mainBlackColor,size: Dimensions.font26,),

                AppIcon(icon: Icons.add,
                  iconColor: Colors.white,
                  backGroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Container(
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
                    topRight: Radius.circular(Dimensions.radius20+10),
                    topLeft: Radius.circular(Dimensions.radius20+10)
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
                      Icon(Icons.favorite,color: AppColors.mainColor),
                      //SizedBox(width: Dimensions.widtht10/2,),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20
                  ),
                  child: BigText(text: "\$28 | Add to cart",color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,

                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
