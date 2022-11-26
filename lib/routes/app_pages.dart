import 'package:get/route_manager.dart';
import 'app_routes.dart';

import '../app/modules/home/home_binding.dart';
import '../app/modules/home/home_page.dart';

class AppPages {
  static final List<GetPage> list = [
    GetPage(
        name: AppRoutes.home, page: () => HomePage(), binding: HomeBinding()),
  ];
}
