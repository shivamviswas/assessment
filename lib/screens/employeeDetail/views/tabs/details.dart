import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shivam_task/screens/employeeDetail/controllers/controller.dart';
import 'package:shivam_task/utility/size_config.dart';
import 'package:shivam_task/utility/widgets/customText.dart';
import 'package:shivam_task/utility/widgets/loading_widget.dart';

class EmpDetails extends StatelessWidget {
  EmpDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetX<EmployeeDetailController>(
        init: EmployeeDetailController(),
        builder: (controller) {
          return controller.isDataLoading
              ? const LoadingWidget()
              : controller.employee == null
                  ? Center(
                      child: CustomText(
                        text: "No Data Available",
                        color: Colors.grey,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: controller.employee!.avatar ?? "n/a",
                            height: 300,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorWidget: (con, err, error) => Image.asset(
                              "assets/placeholder.png",
                              height: 200,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          _detailTile(
                              title: "Name", value: controller.employee!.name!),
                          const Divider(
                            height: 16,
                            thickness: 1,
                          ),
                          _detailTile(
                              title: "Email",
                              value: controller.employee!.email!),
                          const Divider(
                            height: 16,
                            thickness: 1,
                          ),
                          _detailTile(
                              title: "Phone",
                              value: controller.employee!.phone!),
                          const Divider(
                            height: 16,
                            thickness: 1,
                          ),
                          _detailTile(
                              title: "Birthday",
                              value: DateFormat("dd MMMM, yyyy")
                                  .format(controller.employee!.birthday!)),
                          const Divider(
                            height: 16,
                            thickness: 1,
                          ),
                          _detailTile(
                              title: "Country",
                              value: controller.employee!.country!),
                          const Divider(
                            height: 16,
                            thickness: 1,
                          ),
                          _detailTile(
                              title: "Department",
                              value:
                                  controller.employee!.department!.join(', ')),
                          const Divider(
                            height: 16,
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
        });
  }

  Widget _detailTile({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title + ':',
            size: 20,
          ),
          CustomText(
            text: value,
          )
        ],
      ),
    );
  }
}
