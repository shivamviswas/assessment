import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shivam_task/service/employee_service/employee_service.dart';

import '../../../models/employee.dart';

class EmployeeDetailController extends GetxController {
  final id = Get.arguments?['id'];

  final RxBool _isDataLoading = false.obs;
  var searchController = TextEditingController();
  var isVisible = true.obs;

  bool get isDataLoading => _isDataLoading.value;

  set isDataLoading(bool value) => _isDataLoading.value = value;

  Employee? employee;

  @override
  void onInit() {
    getData(id: id);
    super.onInit();
  }

  void getData({required id}) async {
    isDataLoading = true;
    try {
      var res = await EmployeeService().getEmployeeById(id: id);
      employee = Employee.fromJson(res);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    } finally {
      isDataLoading = false;
    }
  }
}
