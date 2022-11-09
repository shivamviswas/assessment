import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shivam_task/screens/bottom_bar/controllers/controller.dart';

class BottomBarScreen extends GetView<BottomBarController> {
   BottomBarScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: controller.item(),
      bottomNavigationBar: BottomNavigationBar(
        items:  const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ],
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onItemTapped,
      ),
    )) ;
  }
}
