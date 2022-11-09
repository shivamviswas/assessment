import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shivam_task/models/checkin.dart';
import 'package:shivam_task/utility/widgets/customText.dart';

import '../../../../utility/widgets/loading_widget.dart';
import '../../controllers/checkin_controller.dart';

class EmployeeCheckIn extends StatelessWidget {
  const EmployeeCheckIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CheckInController>(
        init: CheckInController(),
        builder: (controller) {
          return  controller.isDataLoading
              ? const LoadingWidget()
              : controller.checkInList.isEmpty
              ? Center(
            child: CustomText(
              text: "No Data Available",
              color: Colors.grey,
            ),
          )
              : ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.checkInList.length,
            itemBuilder: (context, index) {
              return checkInTile(controller.checkInList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 16,
              );
            },
          );
        });
  }

  Widget checkInTile(CheckIn checkIn) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _detailTile(title: "Check In ", value: DateFormat("dd MMM, yyyy hh:mm a").format(checkIn.checkin!)),
        const SizedBox(
          height: 8,
        ),
        _detailTile(title: "Location", value: checkIn.location!),
        const SizedBox(
          height: 8,
        ),
        CustomText(
          text: 'Purpose: ',
          size: 20,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomText(
          text:
              checkIn.purpose!,
          fontWeight: FontWeight.w500,
          size: 14,
        ),
      ],
    );
  }

  Widget _detailTile({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: '$title: ',
          size: 20,
        ),
        CustomText(
          text: value,
        )
      ],
    );
  }
}
