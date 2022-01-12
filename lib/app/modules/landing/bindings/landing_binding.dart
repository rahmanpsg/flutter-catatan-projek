import 'package:catatan_projek/app/controllers/transaksi_controller.dart';
import 'package:catatan_projek/app/modules/tambah/controllers/tambah_controller.dart';
import 'package:get/get.dart';

import '../controllers/landing_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(() => LandingController());
    Get.lazyPut<TransaksiController>(() => TransaksiController());
    Get.lazyPut<TambahController>(() => TambahController());
  }
}
