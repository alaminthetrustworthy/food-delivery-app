//import 'dart:html';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery_app/utils/color.dart';



import '../utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/expandable_text_widget.dart';
import '../widgets/small_text.dart';

class Recommended extends StatefulWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  PageController pagecontroller=PageController(viewportFraction: 1.9);
  var _current_page=0.0;

  void initState(){
    super.initState();
    pagecontroller.addListener(() {
      _current_page=pagecontroller.page!;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        //header details ui here
        margin: EdgeInsets.only(left: 30,right: 30),
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text Container
                Container(
                  child: Column(
                    children: [
                      BigText(text: "Bangladesh",color: Colors.cyan,),
                     // SizedBox(height: 5,),
                      Row(children: [
                        SmallText(text: "Narshingdi",),
                        SizedBox(width: 5,),
                        Icon(Icons.arrow_drop_down),
                      ],),


                    ],
                  ),
                ),
                Container(child:
                Icon(Icons.notification_important,color: Colors.cyan,)
                  ,)
              ],
            ),
              //search bar
            SizedBox(height: 5,),
            Container(
              height: 40,
              padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Search the value",),
                  Icon(Icons.search)
                ],
              ),
            ),

            SizedBox(height: 5,),
            //sliders
            Container(
              height: 220,
              child: PageView.builder(
                itemCount: 5,
                  itemBuilder: (context ,position){
                    return _buildPager(position);
                  }),
            ),
            SizedBox(height: 5,),

            //dots indicator
            DotsIndicator(
      dotsCount: 5,
      position: _current_page,

      decorator: DotsDecorator(
      activeColor: AppColors.mainColor,
      size: const Size.square(9.0),
      activeSize: const Size(18.0, 9.0),
      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),
            //SizedBox(height: 5,),
            //Popular section
           Row(
             children: [
               BigText(text: "Popular"),
               SizedBox(width: 5,),
               SmallText(text: "."),
               SizedBox(width: 5,),
               SmallText(text: "what most peaple eat"),
             ],
           ),
            //SizedBox(height: 5,),

           Expanded(
             child: ListView.builder(
               //physics: NeverScrollableScrollPhysics(),
               itemCount: 5,
               shrinkWrap: true,
               itemBuilder: (context,index){
                 return Container(

                  margin: EdgeInsets.only(
                    bottom: 10,

                  ),
                   child: Row(
                     children: [
                       Container(
                         height:120,
                         width: 120,
                         decoration:BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image: AssetImage(
                                     "assets/image/food3.png"
                                 )
                             )
                         ),

                       ),
                      Expanded(child:
                      Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 10
                        ),
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),bottomRight:Radius.circular(20) )
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                BigText(text: "Nutrious fruit meals")
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                SmallText(text: "with chinese charateristics")
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: Colors.amber,),
                                SmallText(text: "Normal"),
                                SizedBox(width: 10,),
                                Icon(Icons.location_on,color: Colors.cyan,),
                                SmallText(text: "1.2 km"),
                                SizedBox(width: 10,),
                                Icon(Icons.access_time,color: Colors.redAccent,),
                                SmallText(text: "34 min"),


                              ],
                            )
                          ],
                        ),
                      )
                      )
                     ],
                   ),
                 );
               },
             ),
           )


          ],


        ) ,




      ),

    );



  }
  Widget _buildPager(int position){
    return Stack(
      children: [
        Container(
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),

              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food1.png"),

              )
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            padding: EdgeInsets.only(top: 20,left: 30,right: 30,bottom: 0),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    BigText(text: "Chinese Side"),
                  ],
                ),

                SizedBox(height: 10,),
                Row(
                  children: [
                    Wrap(children:(
                      List.generate(5, (index) => Icon(Icons.star,size: 20,color: AppColors.mainColor))
                    ), ),
                    SizedBox(width: 10,),
                    SmallText(text: "4.5"),
                    SizedBox(width: 10,),
                    SmallText(text: "1234"),
                    SizedBox(width: 10,),
                    SmallText(text: "Comments"),

                  ],
                ),
                SizedBox(height: 10,),
                Row(

                  children: [
                    Icon(Icons.circle,color: Colors.amberAccent,size: 24,),
                    SizedBox(width: 5,),
                    SmallText(text: "Normal"),
                    SizedBox(width: 20,),
                    Icon(Icons.location_on,color: AppColors.mainColor,size: 24,),
                    SizedBox(width: 5,),
                    SmallText(text: "1.7km"),
                    SizedBox(width: 20,),
                    Icon(Icons.access_time,color: Colors.red,size: 24,),
                    SizedBox(width: 5,),
                    SmallText(text: "32 Min"),

                  ],
                )

              ],
            ),
          ),
        ),


      ],
    );
  }

}
