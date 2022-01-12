import 'package:get/get.dart';

import '../controllers/tambah_controller.dart';

class TambahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahController>(
      () => TambahController(),
    );
  }
}
