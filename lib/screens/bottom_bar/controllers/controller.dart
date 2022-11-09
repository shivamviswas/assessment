import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../employeeList/views/employe_list.dart';

class BottomBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  Widget item() {
    switch (selectedIndex.value) {
      case 0:
        return EmployeeListScreen();
      case 1:
        return Container();
    }
    return Container();
  }
}
