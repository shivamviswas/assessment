import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shivam_task/utility/appTheme/app_theme.dart';
import 'package:shivam_task/utility/widgets/customText.dart';

class SortBottomSheet extends StatelessWidget {
  var orderBy = "asc".obs;
  var sortBy = "createBy".obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child:Obx(()=> Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.back(result: {
                    "sortBy":sortBy.value,
                    "order":orderBy.value,
                  });
                },
                child: const Text(
                  "Done",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomText(
            text: "Sort By",
            size: 18,
            fontWeight: FontWeight.w600,
          ),
          RadioListTile<String>(
            value: "createBy",
            groupValue: sortBy.value,
            onChanged: (value) {
              sortBy.value = value!;
            },
            title: CustomText(
              text: "Id created",
              size: 16,
              fontWeight: FontWeight.w500,
              color: AppTheme.primaryColor,
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile<String>(
            value: "name",
            groupValue: sortBy.value,
            onChanged: (value) {
              sortBy.value = value!;
            },
            title: CustomText(
              text: "Name",
              size: 16,
              fontWeight: FontWeight.w500,
              color: AppTheme.primaryColor,
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomText(
            text: "Order By",
            size: 18,
            fontWeight: FontWeight.w600,
          ),
          RadioListTile<String>(
            value: "asc",
            groupValue: orderBy.value,
            onChanged: (value) {
              orderBy.value = value!;
            },
            title: CustomText(
              text: "Ascending",
              size: 16,
              fontWeight: FontWeight.w500,
              color: AppTheme.primaryColor,
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile<String>(
            value: "desc",
            groupValue: orderBy.value,
            onChanged: (value) {
              orderBy.value = value!;
            },
            title: CustomText(
              text: "Descending",
              size: 16,
              fontWeight: FontWeight.w500,
              color: AppTheme.primaryColor,
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        ],
      )),
    );
  }
}
