import 'package:get/get.dart';
class Dimensions{
  static double screenHeight=Get.context!.height;
  static double screenWidth=Get.context!.width;
  /*
  //formula divide screen that am currently using is 684/x, =screenHeight/3.12
  where is refered to as the height of screen where the container has 120 height as
  unit screenHeight/containeHeight
  then
   */
  //height dynamic dimension
  static double height10=screenHeight/80.4;
  static double height20=screenHeight/40.2;
  static double height15=screenHeight/53.6;
  static double height30=screenHeight/26.8;
  static double height45=screenHeight/17.8;
  static double height120=screenHeight/6.7;

  // width dynamic dimensions
  static double widtht10=screenHeight/80.4;
  static double width20=screenHeight/40.2;
  static double width15=screenHeight/53.6;
  static double width30=screenHeight/26.8;
  static double width45=screenHeight/17.8;

//font sizes
  static double font20=screenHeight/40.2;
  static double font26=screenHeight/31.01;
  static double font16=screenHeight/50.25;


  static double radius20=screenHeight/40.2;
  static double radius15=screenHeight/53.6;
  static double radius30=screenHeight/26.8;
  static double radius25=screenHeight/32.16;

  static double pageViewContainer=screenHeight/3.65;
  static double pageView=screenHeight/2.51;
  static double pageViewTextContainer=screenHeight/6.7;

  //icon dynamic dimension
  static  double iconSize24=screenHeight/33.5;
  static  double iconSize16=screenHeight/50.25;
  //listView image size
  static double listViewimgSize =screenWidth/3.43;
  static double listViewTextimgSize =screenWidth/4.1;

  //popular food
static double popularFoodSize=screenHeight/2.74;
//bottom height
  static double bottomHeightBar=screenHeight/5.7;






}