import 'package:appartment_app/bindings/global_binding.dart';
import 'package:appartment_app/utils/constants/colors.dart';
import 'package:appartment_app/views/apartment_view/appartment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondaryColor),
        useMaterial3: true,
      ),
      initialBinding: GlobalBinding(),
      home: const ApartmentView(),
    );
  }
}
