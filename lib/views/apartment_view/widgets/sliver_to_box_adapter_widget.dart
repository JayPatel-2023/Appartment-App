// ignore_for_file: prefer_const_constructors

import 'package:appartment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/appartment_controller.dart';

class SliverToBoxAdapterWidget extends StatelessWidget {
  const SliverToBoxAdapterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade600,
                  Colors.grey.shade200
                ], // Gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              color: AppColors.secondaryColor,
            ),
          ),
          Positioned(
            top: -18,
            right: 0,
            left: 0,
            child: Icon(
              Icons.bookmark_sharp,
              size: 150,
              color: AppColors.cyan900,
            ),
          ),
          GetBuilder<ApartmentController>(
            id: ApartmentController.backButtonId,
            builder: (controller) {
              if (!controller.isScrolled) {
                return Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        color: AppColors.primaryColor),
                    onPressed: () => {},
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
