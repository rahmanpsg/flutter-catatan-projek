import 'package:catatan_projek/app/modules/tambah/bindings/tambah_binding.dart';
import 'package:catatan_projek/app/modules/tambah/views/tambah_view.dart';
import 'package:get/get.dart';

import '../modules/landing/bindings/landing_binding.dart';
import '../modules/landing/views/landing_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANDING;

  static final routes = [
    GetPage(
      name: _Paths.LANDING,
      page: () => LandingView(),
      binding: LandingBinding(),
    ),
  ];
}
