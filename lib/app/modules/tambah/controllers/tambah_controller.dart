import 'package:catatan_projek/app/controllers/transaksi_controller.dart';
import 'package:catatan_projek/app/data/models/transaksi_model.dart';
import 'package:catatan_projek/app/modules/landing/controllers/landing_controller.dart';
import 'package:catatan_projek/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TambahController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController tahunController;
  late TextEditingController namaController;
  late TextEditingController judulController;
  late TextEditingController jumlahController;
  late TextEditingController belumLunasController;

  late TransaksiController transaksiController;
  late LandingController landingController;

  @override
  void onInit() {
    tahunController = TextEditingController();
    namaController = TextEditingController();
    judulController = TextEditingController();
    jumlahController = TextEditingController();
    belumLunasController = TextEditingController();

    transaksiController = Get.find<TransaksiController>();
    landingController = Get.find<LandingController>();
    super.onInit();
  }

  @override
  void onClose() {
    tahunController.dispose();
    namaController.dispose();
    judulController.dispose();
    jumlahController.dispose();
    belumLunasController.dispose();
  }

  void selectTahun(BuildContext context) {
    try {
      Get.bottomSheet(
        Container(
          width: MediaQuery.of(context).size.width,
          child: YearPicker(
            selectedDate: tahunController.text.isEmpty
                ? DateTime.now()
                : DateTime(
                    int.parse(tahunController.text),
                  ),
            firstDate: DateTime(2020),
            lastDate: DateTime.now(),
            onChanged: (val) {
              tahunController.text = DateFormat('yyyy').format(val);
              try {
                Get.back();
                FocusScope.of(context).nextFocus();
              } catch (e) {
                printError(info: e.toString());
              }
            },
          ),
        ),
        backgroundColor: bgColor,
      );
    } catch (e) {
      printError(info: e.toString());
    }
  }

  void simpanTransaksi(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Transaksi transaksi = Transaksi(
        tahun: int.parse(
          tahunController.text,
        ),
        nama: namaController.text,
        judul: judulController.text,
        pemasukan: int.parse(
          jumlahController.text.replaceAll('.', ''),
        ),
        belumLunas: int.parse(
          belumLunasController.text.replaceAll('.', ''),
        ),
      );

      if (transaksiController.addTransaksi(transaksi)) {
        resetForm();
        FocusScope.of(context).unfocus();
        landingController.changePage(0);
      }
    }
  }

  void resetForm() {
    tahunController.clear();
    namaController.clear();
    judulController.clear();
    jumlahController.clear();
    belumLunasController.clear();
  }
}
