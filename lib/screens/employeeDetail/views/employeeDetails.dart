import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shivam_task/screens/bottom_bar/controllers/controller.dart';
import 'package:shivam_task/screens/employeeDetail/views/tabs/details.dart';

import 'tabs/employee_check_in.dart';

class EmployeeDetailScreen extends GetView<BottomBarController> {
  const EmployeeDetailScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Employee Details'),
          bottom: const TabBar(tabs:  [
            Tab(icon: Icon(Icons.person),text: 'Employee Details'),
            Tab(icon: Icon(Icons.playlist_add_check),text: 'CheckIns',),
          ],
          ),
        ),
        body:  TabBarView(
          children: [
            EmpDetails(),
            EmployeeCheckIn()
          ],
        ),
      ),
    );
  }
}
