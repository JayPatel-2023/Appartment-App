// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:appartment_app/controllers/appartment_controller.dart';

import 'package:appartment_app/utils/constants/colors.dart';
import 'package:appartment_app/utils/constants/labels.dart';
import 'package:appartment_app/views/apartment_view/widgets/increment_decrement_widget.dart';
import 'package:appartment_app/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomPriceWidget extends GetView<ApartmentController> {
  BottomPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<ApartmentController>(builder: (context) {
            return IncrementDecrementWidgetx(
              decrement: () => controller
                  .decrementQuantity(controller.selectedApartmentSize),
              increment: () => controller
                  .incrementQuantity(controller.selectedApartmentSize),
              counter: controller.selectedApartmentSize.quantity.toString(),
            );
          }),
          SizedBox(width: 12.0),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                CustomSnackbar.showSnackbar(title: "Added", message: "Order value is ${AppLabels.rupeeSymbol} ${controller.getTotalPrice().toStringAsFixed(2)}");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                foregroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: GetBuilder<ApartmentController>(
                builder: (controller) {
                  return Text(
                      "${AppLabels.addToCart} ${AppLabels.rupeeSymbol} ${controller.getTotalPrice().toStringAsFixed(2)}");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
