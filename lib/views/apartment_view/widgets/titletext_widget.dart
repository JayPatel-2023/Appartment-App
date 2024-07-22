// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:appartment_app/utils/constants/styles.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  TitleText({super.key,required this.title,this.isRequired = false});

  String title;
  bool isRequired;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppStyles.titleStyle,
          ),
          if (isRequired)
            TextSpan(
              text: " *",
              style: AppStyles.isRequiredStyle,
            ),
        ],
      ),
    );
  }
}
