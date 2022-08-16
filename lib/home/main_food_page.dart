import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/color.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print(("the current height is "+MediaQuery.of(context).size.height.toString()));
    print(("the current width is "+MediaQuery.of(context).size.width.toString()));
    return Scaffold(
      body: Column(
        children: [
          //main container for the header
           Container(

            child: Container(
              margin:EdgeInsets.only(top:Dimensions.height15,bottom:Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    //text country and city drop down goes here
                    children:  [
                      BigText(text: "Nigeria",
                      color: AppColors.mainColor,
                        size: Dimensions.height30,
                      ),

                     Row(
                       children: [
                         SmallText(text: 'Yerwa',
                          color: Colors.black54,
                         ),
                         Icon(Icons.arrow_drop_down_rounded)
                       ],
                     )
                    ],
                  ),
                  Container(
                    //search goes here
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    child: Icon(Icons.search,color: Colors.white, size:Dimensions.iconSize24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,

                    ),



                  )

                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      ),
    );
  }
}
