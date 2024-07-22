// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:appartment_app/controllers/appartment_controller.dart';
import 'package:appartment_app/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';

class IncrementDecrementWidgetx extends StatelessWidget {
  IncrementDecrementWidgetx(
      {super.key,
      required this.decrement,
      required this.increment,
      required this.counter});

  void Function() decrement;
  void Function() increment;
  String counter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Item decrementar button
        InkWell(
          onTap: decrement,
          splashColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            decoration: AppStyles.iconButtonDecoration(left: true),
            child:
                Icon(Icons.remove, color: AppColors.secondaryColor, size: 18.0),
          ),
        ),

        // Items count
        GetBuilder<ApartmentController>(builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.0),
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                    color: AppColors.secondaryColor,
                    style: BorderStyle.solid,
                    width: 1.0),
              ),
              shape: BoxShape.rectangle,
            ),
            child: Text(counter,
                style:
                    TextStyle(color: AppColors.secondaryColor, fontSize: 14.0)),
          );
        }),

        // Item incrementar button
        InkWell(
          onTap: increment,
          splashColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            decoration: AppStyles.iconButtonDecoration(right: true),
            child: Icon(Icons.add, color: AppColors.secondaryColor, size: 18.0),
          ),
        ),
      ],
    );
  }
}
