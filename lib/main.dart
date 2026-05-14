import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/routes/bindings.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Inventory Management',

          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),

          initialRoute: AppPages.initial,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
