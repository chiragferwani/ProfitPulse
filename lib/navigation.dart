import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:profitpulse/banks.dart';
import 'package:profitpulse/calculators.dart';
import 'package:profitpulse/home.dart';
import 'package:profitpulse/profile.dart';
import 'package:ionicons/ionicons.dart';
import 'package:profitpulse/projectdetails.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProfitPulse', 
          style: TextStyle(
            fontFamily: 'PoppinsMedium', 
            fontSize: 24,
            color: Colors.white),),
          leading: Icon(Ionicons.cloud_done_outline, color: Colors.white,),
          backgroundColor: Colors.blue,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ProjectDetails())
              ),
              icon: const Icon(Ionicons.settings_outline, color: Colors.white,),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            indicatorColor: const Color.fromARGB(255, 233, 233, 233),
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Ionicons.home), label: 'Home',), 
              NavigationDestination(icon: Icon(Ionicons.calculator), label: 'Calculators'),
              NavigationDestination(icon: Icon(Ionicons.briefcase), label: 'Banks'),
              NavigationDestination(icon: Icon(Ionicons.person), label: 'Profile')
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value])
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    Home(), 
    const Calculators(),
    const Banks(),
    const Profile()
    ];
}