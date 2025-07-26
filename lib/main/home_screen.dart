import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alpha_learnapp/controllers/navigation_controller.dart';
import 'package:alpha_learnapp/main/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    final List<Widget> pages = [
      const Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
      const Center(child: Text('Movies Page', style: TextStyle(fontSize: 24))),
      const Center(child: Text('Favorite Page', style: TextStyle(fontSize: 24))),
      const ProfileScreen(),
    ];

    return Obx(() => Scaffold(
          // Removed appBar and bottomNavigationBar
          body: pages[homeController.selectedIndex.value],
        ));
  }
}
