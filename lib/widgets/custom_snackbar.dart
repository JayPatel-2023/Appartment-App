import 'package:appartment_app/utils/constants/colors.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static showSnackbar({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.secondaryColor,
      colorText: AppColors.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }
}
