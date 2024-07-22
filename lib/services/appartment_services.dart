import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ApartmentService {
  static ApartmentService get instance => Get.find<ApartmentService>();

  Future<dynamic> fetchJson(String path) async {
    try {
      final String response = await rootBundle.loadString(path);
      final data = json.decode(response);
      return data;
    } catch (e) {
      log('Error fetching apartment data: $e');
      throw Exception('Failed to load json data');
    }
  }
}
