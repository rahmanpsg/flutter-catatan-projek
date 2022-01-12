import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/routes/app_pages.dart';
import 'app/themes/app_theme.dart';

void main() async {
  await Hive.initFlutter();

  runApp(
    GetMaterialApp(
      title: "Catatan Projek",
      theme: AppTheme.basic,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
