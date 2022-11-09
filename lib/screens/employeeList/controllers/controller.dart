import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shivam_task/service/employee_service/employee_service.dart';

import '../../../models/employee.dart';
import '../../../utility/widgets/sort_dialog.dart';

class EmployeeListController extends GetxController {
  final RxBool _isDataLoading = false.obs;
  var searchController = TextEditingController();
  var isVisible = true.obs;

  bool get isDataLoading => _isDataLoading.value;

  set isDataLoading(bool value) => _isDataLoading.value = value;

  RxList<Employee> _employeeList = <Employee>[].obs;

  List<Employee> get employeeList => _employeeList;
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  ScrollController scrollController = ScrollController();

  int page = 1;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData({String? search}) async {
    isDataLoading = true;
    try {
      var res = await EmployeeService().getAllEmployee(page: 1, search: search);
      _employeeList.value =
          List<Employee>.from(res.map((e) => Employee.fromJson(e)));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isDataLoading = false;
    }
  }

  loadMore() async {
    try {
      var res = await EmployeeService().getAllEmployee(page: page);
      var newData = List<Employee>.from(res.map((e) => Employee.fromJson(e)));
      employeeList.addAll(newData);
      if (newData.isNotEmpty) {
        page++;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      refreshController.loadComplete();
    }
  }

  onRefresh() async {
    try {
      var res = await EmployeeService().getAllEmployee(page: 1);
      _employeeList.value =
          List<Employee>.from(res.map((e) => Employee.fromJson(e)));
      page = 1;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      refreshController.refreshCompleted();
    }
  }

  void onSorting() async {
    var result = await Get.bottomSheet(SortBottomSheet());
    if (result == null) return;

    isDataLoading = true;
    try {
      var res = await EmployeeService().getSortedData();
      _employeeList.value =
          List<Employee>.from(res.map((e) => Employee.fromJson(e)));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isDataLoading = false;
    }
  }
}
