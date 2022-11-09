import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'routes/app_pages.dart';
import 'utility/appTheme/app_theme.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(680, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'MyTask',
      useInheritedMediaQuery: true,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppTheme.primaryColor,
            secondary: AppTheme.accentColor,
          ),
          ),
    );
  }
}