import 'package:flutter/material.dart';
import 'package:shivam_task/utility/appTheme/app_theme.dart';

class CustomText extends StatelessWidget {
  double? size, lineHeight;
  int? maxLine;
  TextOverflow? textOverflow;
  bool? softWarp;
  Color? color;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  String text;
  TextDecoration? textDecoration;


   CustomText(
      {
        Key? key,
        this.size,
        this.maxLine,
        this.lineHeight,
        this.textDecoration,
        this.textOverflow,
        this.softWarp,
        this.textAlign,
        this.color,
        this.fontWeight,
        required this.text,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: textAlign ?? TextAlign.start,
    maxLines: maxLine,
    softWrap: softWarp,
    overflow: textOverflow,
        style: TextStyle(
        height: lineHeight ?? 1.3,
        decoration: textDecoration,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: size ?? 16),);
  }
}
