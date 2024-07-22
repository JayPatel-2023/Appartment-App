import 'dart:developer';

import 'package:appartment_app/services/appartment_services.dart';
import 'package:appartment_app/utils/constants/constants.dart';
import 'package:appartment_app/utils/constants/labels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/cleaning_service_model.dart';
import '../models/specification_item_model.dart';
import '../models/specification_model.dart';

class ApartmentController extends GetxController {
  static String get backButtonId => "backButtonId";
  static String get mainId => "mainId";

  bool isScrolled = false;
  bool isLoading = true;
  CleaningService? cleaningService;
  SpecificationItem selectedApartmentSize = SpecificationItem(
    id: "",
    name: [],
    price: 0,
    specificationGroupId: "",
    uniqueId: 0,
    isSelected: false,
    quantity: 0,
    sequenceNumber: 0,
    isDefaultSelected: false,
  );
  List<Specification> apartmentSizes = [];
  List<Specification> bedroomCleaning = [];
  List<Specification> livingRoomCleaning = [];
  List<Specification> bathroomCleaning = [];
  List<Specification> kitchenCleaning = [];
  List<SpecificationItem> cart = [];
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    scrollController.addListener(_onScroll);
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }

  void _onScroll() {
    if (scrollController.offset > 0 && !isScrolled) {
      isScrolled = true;
    } else if (scrollController.offset <= 0 && isScrolled) {
      isScrolled = false;
    }
    update([backButtonId]);
  }

  void loadData() async {
    try {
      update([mainId]);
      final data = await ApartmentService.instance
          .fetchJson(AppConstants.cleaningServicePath);

      if (data != null) {
        cleaningService = CleaningService.fromJson(data);
        apartmentSizes = cleaningService?.specifications
                .where((spec) => spec.name.first == AppLabels.apartmentSize)
                .toList() ??
            [];
        if (apartmentSizes.isNotEmpty && apartmentSizes.first.list.isNotEmpty) {
          selectApartmentSize(apartmentSizes.first.list.first);
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }

    isLoading = false;
    update([mainId]);
  }

  void selectApartmentSize(SpecificationItem? size) {
    if (size != null) {
      selectedApartmentSize = size;
      selectedApartmentSize.isSelected = true;
    }
    updateOtherSections();
    update();
  }

  void updateOtherSections() {
    String modifierName = selectedApartmentSize.name.first;
    bedroomCleaning =
        _getSpecificationsForModifier(AppLabels.bedroomCleaning, modifierName);
    livingRoomCleaning = _getSpecificationsForModifier(
        AppLabels.livingRoomCleaning, modifierName);
    bathroomCleaning =
        _getSpecificationsForModifier(AppLabels.bathroomCleaning, modifierName);
    kitchenCleaning =
        _getSpecificationsForModifier(AppLabels.kitchenCleaning, modifierName);
    update();
  }

  List<Specification> _getSpecificationsForModifier(
      String name, String modifierName) {
    return cleaningService?.specifications
            .where((spec) =>
                spec.name.first == name && spec.modifierName == modifierName)
            .toList() ??
        [];
  }

  void toggleItemSelection(SpecificationItem item) {
    item.isSelected = !item.isSelected;
    if (item.isSelected) {
      item.quantity = 1;
    } else {
      item.quantity = 0;
    }
    update();
  }

  void incrementQuantity(SpecificationItem item) {
    if (item.isSelected) {
      item.quantity++;
      update();
    }
    log(item.quantity.toString());
  }

  void decrementQuantity(SpecificationItem item) {
    if (item.isSelected && item.quantity > 1) {
      item.quantity--;
      update();
    }
  }

  double getTotalPrice() {
    double total =
        (selectedApartmentSize.price) * (selectedApartmentSize.quantity);
    total += _getSectionTotal(bedroomCleaning);
    total += _getSectionTotal(livingRoomCleaning);
    total += _getSectionTotal(bathroomCleaning);
    total += _getSectionTotal(kitchenCleaning);
    return total;
  }

  double _getSectionTotal(List<Specification> specifications) {
    return specifications
        .expand((spec) => spec.list)
        .where((item) => item.isSelected)
        .fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  bool isSectionEmpty(List<Specification> specifications) {
    return specifications.isEmpty ||
        specifications.every((spec) => spec.list.isEmpty);
  }

  
}
