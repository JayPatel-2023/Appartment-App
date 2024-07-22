// ignore_for_file: prefer_const_constructors

import 'package:appartment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  AppStyles._();

  static TextStyle get titleStyle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      );

  static TextStyle get isRequiredStyle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.redColor,
      );

  static TextStyle get subTitleStyle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.greyColor,
      );

  static Decoration iconButtonDecoration({bool left = false, bool right = false}) {
    return BoxDecoration(
      border: Border.all(
          color: AppColors.secondaryColor,
          width: 1.0,
          style: BorderStyle.solid),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(
          topLeft: left ? Radius.circular(20.0) : Radius.circular(0.0),
          bottomLeft: left ? Radius.circular(20.0) : Radius.circular(0.0),
          topRight: right ? Radius.circular(20.0) : Radius.circular(0.0),
          bottomRight: right ? Radius.circular(20.0) : Radius.circular(0.0),
         ),
    );
  }
}
