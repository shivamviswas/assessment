

import 'package:flutter/material.dart';

import '../appTheme/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppTheme.primaryColor,
      ),
    );
  }
}
