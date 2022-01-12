import 'package:get/get.dart';

class LandingController extends GetxController {
  var currentIndex = 0.obs;

  final pages = <String>['/home', '/tambah'];

  @override
  void onInit() {
    super.onInit();
  }

  void changePage(int index) {
    currentIndex.value = index;
    // Get.toNamed(pages[index], id: 1);
    // Get.offAllNamed(pages[index], id: 1);
  }
}
