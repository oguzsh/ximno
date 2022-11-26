import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'routes/app_routes.dart';

import 'core/utils/constants.dart';
import 'routes/app_pages.dart';

import 'package:ximno/app/modules/home/home_binding.dart';

void main() {
  runApp(const XimnoApp());
}

class XimnoApp extends StatelessWidget {
  const XimnoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      initialRoute: AppRoutes.home,
      initialBinding: HomeBinding(),
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
    );
  }
}
