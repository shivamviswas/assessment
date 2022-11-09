import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shivam_task/models/employee.dart';
import 'package:shivam_task/routes/app_pages.dart';

import 'package:shivam_task/utility/appTheme/app_theme.dart';
import 'package:shivam_task/utility/extention/on_tap_ext.dart';
import 'package:shivam_task/utility/size_config.dart';
import 'package:shivam_task/utility/widgets/customText.dart';
import 'package:shivam_task/utility/widgets/keybord_close.dart';
import 'package:shivam_task/utility/widgets/loading_widget.dart';
import 'package:shivam_task/utility/widgets/search_bar.dart';

import '../controllers/controller.dart';

class EmployeeListScreen extends StatelessWidget {
  EmployeeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetX<EmployeeListController>(
        init: EmployeeListController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Employee List'),
            ),
            body: KeyboardClose(
              child: Column(
                children: [
                  SearchBar(
                    controller: controller.searchController,
                    onChange: (value) {
                      controller.getData(search: value);
                    },
                  ),
                  Expanded(
                    child: controller.isDataLoading
                        ? const LoadingWidget()
                        : controller.employeeList.isEmpty
                            ? Center(
                                child: CustomText(
                                  text: "No Data Available",
                                  color: Colors.grey,
                                ),
                              )
                            : SmartRefresher(
                                header: WaterDropMaterialHeader(
                                  backgroundColor: AppTheme.accentColor,
                                  color: AppTheme.primaryOffWhite,
                                ),
                                controller: controller.refreshController,
                                enablePullUp: true,
                                onRefresh: controller.onRefresh,
                                onLoading: controller.loadMore,
                                child: ListView.separated(
                                  itemCount: controller.employeeList.length,
                                  controller: controller.scrollController,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return employeeList(
                                        controller.employeeList[index]);
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Divider();
                                  },
                                ),
                              ),
                  ),
                ],
              ).paddingAll(16),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                controller.onSorting();
              },
              label: const Text("Sort"),
              icon: const Icon(Icons.sort),
            ),
          );
        });
  }

  Widget employeeList(Employee employee) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        color: Colors.grey,
        height: 84,
        width: 100,
        child: CachedNetworkImage(
          imageUrl: employee.avatar ?? "n/a",
          height: 84,
          fit: BoxFit.cover,
          width: 100,
          errorWidget: (con, err, error) => Image.asset(
            "assets/placeholder.png",
            height: 84,
            fit: BoxFit.cover,
            width: 100,
          ),
        ),
      ),
      const SizedBox(
        width: 8,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: employee.name ?? "Employee-Name",
            color: AppTheme.primaryColor,
            size: 18,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
            text: employee.email ?? "Employee-Email",
            color: AppTheme.primaryBlack,
            size: 14,
          ),
        ],
      ),
    ]).onClick(() =>
        Get.toNamed(Routes.EMPLOYEE_DETAIL, arguments: {"id": employee.id!}));
  }
}
