import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/recommened_product_controller.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/pages/food/popular_food_details.dart';
import 'package:food_delivery_app/utils/color.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../controller/popular_product_controller.dart';
import '../routes/route_helper.dart';
import '../utils/app_constant.dart';
import '../widgets/icon_and_text_widget.dart';
import '../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);


  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController=PageController(viewportFraction: 0.9);
  var _currentPage=0.0;
  var _scaleFactor=0.8;
  var _height=220;
  //initState() initialize the page
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      //take value of current page
      _currentPage=pageController.page!;

    });

  }
  // to avoid memory leak we dispose the page
  @override
  void dispose(){
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider sections
        GetBuilder<PopularProductController>(builder: (popularProductInstace){
          return popularProductInstace.isLoaded?Container(
            height: Dimensions.pageView,
            /// color: Colors.redAccent,
            child: GestureDetector(
              onTap: (){
               // Get.toNamed(RoutesHelper.getPopular(i));
              },
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProductInstace.popularProductList.length,
                  itemBuilder: (context,position){

                    return _builPageItem(position,popularProductInstace.popularProductList[position]);
                  }),
            ),
          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),




        //dots indicator section
        GetBuilder<PopularProductController>(builder: (popularProduct){
          return  DotsIndicator(
            dotsCount: popularProduct.popularProductList.isEmpty?1:popularProduct.popularProductList.length,
            position: _currentPage,

            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),



        //Popular text Section here
        SizedBox(height: Dimensions.height20,),

        Container(
          margin: EdgeInsets.only(left: Dimensions.height30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.widtht10/5,),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text: ".",),
              ),
              SizedBox(width: Dimensions.widtht10/5,),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: SmallText(text: "food paring"),
              )
            ],
          ),
        ),


        //Recommended food page
        //list of food and images


        GetBuilder<RecommendedProductController>(builder: (recommededProduct){
          return recommededProduct.isLoaded?ListView.builder(

              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommededProduct.recommendedProductList.length,
              itemBuilder: (context,index){
                return Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(RoutesHelper.getRecommendedFood(index));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.widtht10,
                          right: Dimensions.widtht10,
                          bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          //container that contained an image
                          Container(
                            height:Dimensions.listViewimgSize,
                            width: Dimensions.height120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius25),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:NetworkImage(
                                      AppConstant.BASE_URL+AppConstant.UPLOAD_URL+recommededProduct.recommendedProductList[index].img!
                                  ),

                                )
                            ),


                          ),
                          //Recommed food detail goes here
                          Expanded(
                            child: Container(
                              height:Dimensions.listViewTextimgSize,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(Dimensions.radius20),
                                    bottomRight: Radius.circular(Dimensions.radius20)
                                ),
                                color: Colors.white,

                              ),
                              // child: Padding(
                              //   padding: EdgeInsets.only(
                              //       left: Dimensions.widtht10,
                              //
                              //   ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: recommededProduct.recommendedProductList[index].name!),
                                  SizedBox(height: Dimensions.height10,),
                                  SmallText(text: "with Yerwa fato characteristics"),
                                  SizedBox(height: Dimensions.height10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      IconAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor1),
                                      IconAndTextWidget(
                                          icon: Icons.location_on,
                                          text: "1.2km",
                                          iconColor: AppColors.mainColor),
                                      IconAndTextWidget(
                                          icon: Icons.access_time,
                                          text: "32 min",
                                          iconColor: Colors.redAccent),
                                    ],
                                  )


                                ],
                              ),
                            ),
                          )//)

                        ],
                      ),
                    ),
                  ),
                );
              }

          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),


      ],
    );
  }
  Widget _builPageItem(int index, ProductModel popularProduct){


    //sclaing an animation here using matrix4 Class
    Matrix4 matrix4=Matrix4.identity();
    if(index==_currentPage.floor()){
      var currScale=1-(_currentPage-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix4=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==_currentPage.floor()+1){
      var currScale=_scaleFactor+(_currentPage-index+1)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix4=Matrix4.diagonal3Values(1, currScale, 1);
      matrix4=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index==_currentPage.floor()-1){
      var currScale=1-(_currentPage-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix4=Matrix4.diagonal3Values (1, currScale, 1);
      matrix4=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else{
      var currScale=0.8;
      matrix4=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

    }


    return Transform(transform: matrix4,
    child: Stack(
    children: [
    GestureDetector(
      onTap: (){
        Get.toNamed(RoutesHelper.getPopular(index));
      },
      //food details
      child: Container(
      height: Dimensions.pageViewContainer,
        margin: EdgeInsets.only(left: Dimensions.height10,right:Dimensions.height10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),

            color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
            image: DecorationImage(
                fit: BoxFit.cover,
                image:NetworkImage(
                    AppConstant.BASE_URL+AppConstant.UPLOAD_URL+popularProduct.img!
                )
            )


        ),
      ),
    ),

    Align(
    alignment: Alignment.bottomCenter,

      child: Container(
        height: Dimensions.pageViewTextContainer,
        margin: EdgeInsets.only(left: Dimensions.height20,right: Dimensions.height20),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFe8e8e),
              blurRadius: 1.0,
              offset: Offset(0,5)
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5,0)
            ),
            BoxShadow(
                color: Colors.white,
                offset: Offset(5,0)
            )
          ]
      ),
      child: Container(
        padding: EdgeInsets.only(top: Dimensions.height10/2,left: Dimensions.height10,right: Dimensions.height10,),
        //app colummn class that contain
        child:AppColum(text: popularProduct.name!,),
      ),
      ),

    )
    ],
    ),

    );
  }
}
