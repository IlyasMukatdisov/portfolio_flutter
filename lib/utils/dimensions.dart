import 'package:flutter/material.dart';

class Dimensions {
  static BuildContext? context;

  static double width = MediaQuery.of(context!).size.width;
  static double height = MediaQuery.of(context!).size.height;

  static double height10 = height / (844 / 10);
  static double height20 = height / (844 / 20);
  static double height25 = height / (844 / 25);
  static double height30 = height / (844 / 30);
  static double width10 = width / (844 / 10);
  static double width20 = width / (844 / 20);
  static double width100 = width / (844 / 100);
}
