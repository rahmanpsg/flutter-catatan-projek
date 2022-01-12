import 'package:catatan_projek/app/modules/home/views/home_view.dart';
import 'package:catatan_projek/app/modules/setting/views/setting_view.dart';
import 'package:catatan_projek/app/modules/tambah/views/tambah_view.dart';
import 'package:catatan_projek/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: [
            HomeView(),
            TambahView(),
            SettingView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Tambah',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          backgroundColor: primaryColor,
          selectedItemColor: secondaryColor,
          unselectedItemColor: bgColor,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
