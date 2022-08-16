import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../utils/color.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColum extends StatelessWidget {
  final String text;
  const AppColum({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        BigText( text:text,size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: (
                  List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor))
              ),
            ),

            SizedBox(width: Dimensions.widtht10,),
            SmallText(text: '4.5',),
            SizedBox(width: Dimensions.widtht10,),
            SmallText(text: '1233'),
            SizedBox(width: Dimensions.widtht10,),
            SmallText(text: "Comments")
          ],
        ),
        SizedBox(height: Dimensions.height20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(icon: Icons.circle_sharp,

              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            //SizedBox(width: 10,),

            IconAndTextWidget(
              icon: Icons.location_on,
              iconColor: AppColors.mainColor,
              text: "1.2km",
            ),
            //SizedBox(width: 10,),
            IconAndTextWidget(icon: Icons.access_time,
                text: "32 Min",
                iconColor:Colors.red),
          ],
        ),
      ],

    );
  }
}
