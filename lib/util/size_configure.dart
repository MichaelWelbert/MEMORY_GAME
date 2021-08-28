import 'package:flutter/material.dart';

class SizeConfigure {
  static late double screenWidth;
  static late double screenHeight;
  static late double screenFactorSizeMultiplier;

  static final double basedScreenWidth = 1536;
  static final double basedScreenHeight = 753;

  static void setUpConfigure(MediaQueryData mediaQuery) {
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;

    //screen size
    double sizeMultiplier = screenWidth / 100;
    double basedScreenWidthSizeMultiplier = basedScreenWidth / 100;
    screenFactorSizeMultiplier = sizeMultiplier / basedScreenWidthSizeMultiplier;
  }
}
