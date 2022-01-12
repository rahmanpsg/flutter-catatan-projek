import 'package:catatan_projek/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingView'),
        centerTitle: true,
      ),
      backgroundColor: bgColor,
      body: Center(
        child: Text(
          'SettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
