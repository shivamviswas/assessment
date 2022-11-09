

import 'package:get/get.dart';
import 'package:shivam_task/screens/bottom_bar/views/bottomBar.dart';
import 'package:shivam_task/screens/employeeDetail/bindings/home_binding.dart';
import 'package:shivam_task/screens/employeeDetail/views/employeeDetails.dart';
import '../screens/bottom_bar/bindings/bottom_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_BAR;

  static final routes = [
    GetPage(
      name: _Paths.BOTTOM_BAR,
      page: () => BottomBarScreen(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_DETAIL,
      page: () => EmployeeDetailScreen(),
      binding: EmployeeDetailBinding(),
    ),

  ];
}
