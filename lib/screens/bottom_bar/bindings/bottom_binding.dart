import 'package:get/get.dart';
import 'package:shivam_task/screens/bottom_bar/controllers/controller.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(
      () => BottomBarController(),
    );
  }
}
