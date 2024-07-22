// ignore_for_file: prefer_const_constructors

import 'package:appartment_app/utils/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/appartment_controller.dart';

class SliverPersistentHeaderWidget extends StatelessWidget {
  const SliverPersistentHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(
        minHeight: 56.0,
        maxHeight: 56.0,
        child: GetBuilder<ApartmentController>(
          id: ApartmentController.backButtonId,
          builder: (controller) => AppBar(
            leading: controller.isScrolled
                ? IconButton(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () => {},
                  )
                : null,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                controller.cleaningService!.name.first,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: controller.isScrolled ? 16.0 : 24.0,
                    fontWeight: controller.isScrolled
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            ),
            centerTitle: controller.isScrolled ? true : false,
            backgroundColor: AppColors.primaryColor,
            elevation: 1.0,
          ),
        ),
      ),
      pinned: true,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
