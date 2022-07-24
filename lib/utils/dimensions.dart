import 'package:flutter/material.dart';

class Dimensions {
  BuildContext? context;
  double? width;
  double? height;
  double? height10;
  double? height20;

  double? height25;

  double? height30;

  double? height200;

  double? width10;

  double? width20;

  double? width100;

  Dimensions({required this.context}) {
    width = MediaQuery.of(context!).size.width;
    height = MediaQuery.of(context!).size.height;
    height10 = height! / (844 / 10);
    height20 = height! / (844 / 20);
    height25 = height! / (844 / 25);
    height30 = height! / (844 / 30);
    height200 = height! / (844 / 200);
    width10 = width! / (844 / 10);
    width20 = width! / (844 / 20);
    width100 = width! / (844 / 100);
  }
}
