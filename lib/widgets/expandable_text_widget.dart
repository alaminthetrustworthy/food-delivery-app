import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/color.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key,
    required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  late String fullText;
   bool hiddenText=true;
   double textHeight=Dimensions.screenHeight/4.55;

   //i love flutter laravel and golang 30 and
  // i like jogging in terms of fitness 50
   @override
   void initState() {
     super.initState();
     if (widget.text.length > textHeight) {
       //print("text height is $textHeight");
       firstHalf = widget.text.substring(0, textHeight.toInt()+1);
       //print("first half is $firstHalf");
       secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
      // print("second half is $secondHalf");
       fullText=firstHalf+" 12012 "+secondHalf;
       //print(fullText);
     }
     else{
       firstHalf=widget.text;
       secondHalf="";

   }}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Dimensions.width20,
        right: Dimensions.width20
      ),
      child: secondHalf.isEmpty?SmallText(text: firstHalf):Column(
        children: [
          //SmallText(text: hiddenText?("$firstHalf..."):(firstHalf+secondHalf)),

          Container(

            child:Text(

              hiddenText?firstHalf:fullText,

            ),
          ),
          InkWell(
            onTap: (){
              setState((){
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
               hiddenText? SmallText(text: "Show more",
                   color: AppColors.mainColor,
                   size:Dimensions.font16):
               SmallText(text: "Show less",
                 color: AppColors.mainColor,
                 size: Dimensions.font16,),

                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color:
                AppColors.mainColor,)
                
                
              ],
            ),

          )
        ],
      ),
    );
  }
}


