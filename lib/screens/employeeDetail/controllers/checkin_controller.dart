import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shivam_task/models/checkin.dart';

import 'package:shivam_task/service/employee_service/employee_service.dart';

class CheckInController extends GetxController {
  final id = Get.arguments?['id'];

  final RxBool _isDataLoading = false.obs;

  bool get isDataLoading => _isDataLoading.value;

  set isDataLoading(bool value) => _isDataLoading.value = value;

  RxList<CheckIn> _checkInList = <CheckIn>[].obs;

  List<CheckIn> get checkInList => _checkInList;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData({String? search}) async {
    isDataLoading = true;
    try {
      var res = await EmployeeService().getCheckIns(
        id: id,
      );
      _checkInList.value =
          List<CheckIn>.from(res.map((e) => CheckIn.fromJson(e)));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isDataLoading = false;
    }
  }
}
