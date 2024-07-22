import 'package:get/get.dart';

extension ResponsiveDouble on double {
  double getWidth() {
    final double getWidth = Get.width;
    return (this * getWidth) / 100;
  }

  double getHeight() {
    final double getHeight = Get.height;
    return (this * getHeight) / 100;
  }
}