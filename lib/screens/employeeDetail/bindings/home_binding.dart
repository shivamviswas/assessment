import 'package:get/get.dart';
import 'package:shivam_task/screens/bottom_bar/controllers/controller.dart';
import 'package:shivam_task/screens/employeeDetail/controllers/controller.dart';


class EmployeeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeDetailController>(
      () => EmployeeDetailController(),
    );
  }
}
