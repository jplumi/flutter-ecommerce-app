import 'package:get/get.dart';

class Dimensions {

  // height and width of current screen
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // using iPhone 12 Pro screenHeight as reference = 844

  static double size100 = screenHeight/8.44;
  static double size110 = screenHeight/7.67;
  static double size130 = screenHeight/6.49;
  static double size240 = screenHeight/3.51;
  static double size330 = screenHeight/2.55;

  static double size10 = screenHeight/84.4;
  static double size15 = screenHeight/56.26;
  static double size20 = screenHeight/42.2;
  static double size24 = screenHeight/35.16;
  static double size30 = screenHeight/29.46;
  static double size45 = screenHeight/18.75;

}