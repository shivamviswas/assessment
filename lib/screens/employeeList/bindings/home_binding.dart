import 'package:get/get.dart';


import '../controllers/controller.dart';

class EmployeeListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeListController>(
      () => EmployeeListController(),
    );
  }
}
