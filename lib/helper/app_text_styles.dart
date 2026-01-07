import 'package:flutter/painting.dart';
import 'package:islami/helper/app_colors.dart';

class AppTextStyles {
  static TextStyle goldBold(double size) => TextStyle(
    color: AppColors.gold,
    fontSize: size,
    fontWeight: FontWeight.bold,
    fontFamily: 'janna'
  );
  static TextStyle whiteBold(double size) => TextStyle(
    color: AppColors.white,
    fontSize: size,
    fontWeight: FontWeight.bold,
    fontFamily: 'janna',
  );
}