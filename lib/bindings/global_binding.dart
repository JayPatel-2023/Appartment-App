import 'package:appartment_app/controllers/appartment_controller.dart';
import 'package:get/get.dart';
import '../services/appartment_services.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApartmentService>(() => ApartmentService());
    Get.lazyPut<ApartmentController>(() => ApartmentController());
  }
}
