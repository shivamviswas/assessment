
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shivam_task/utility/extention/on_tap_ext.dart';

import '../appTheme/app_theme.dart';


class SearchBar extends StatelessWidget {
  final TextEditingController controller;

  ValueChanged<String>? onChange;

  SearchBar({Key? key, required this.controller, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      style: TextStyle(color: AppTheme.primaryBlack, fontSize: 18),
      decoration: InputDecoration(
        fillColor: AppTheme.primaryOffWhite,
        filled: true,
        hintText: "Search here...",
        hintStyle: TextStyle(
            color: AppTheme.primaryBlack,
            fontSize: 18,
            fontWeight: FontWeight.w300),
        prefixIcon:  Icon(
          CupertinoIcons.search,
          color:AppTheme.primaryColor,
        ),
        suffixIcon: Icon(
          CupertinoIcons.clear_circled,
          size: 18,
          color: AppTheme.primaryGrey.withOpacity(.8),
        ).onClick(() {
          controller.clear();
        }),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(width: 1, color: AppTheme.primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(width: 1, color: AppTheme.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(width: 1, color: AppTheme.primaryColor)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(width: 1, color: AppTheme.primaryColor)),
      ),
    );
  }
}
