import 'package:flutter/material.dart';

extension OnClickExt on Widget {
  //
  InkWell onClick(VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }
}
