import 'package:catatan_projek/app/controllers/transaksi_controller.dart';
import 'package:catatan_projek/app/data/models/transaksi_model.dart';
import 'package:catatan_projek/app/modules/landing/controllers/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TambahController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController tanggalController;
  late TextEditingController namaController;
  late TextEditingController judulController;
  late TextEditingController jumlahController;
  late TextEditingController belumLunasController;

  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));

  late TransaksiController transaksiController;
  late LandingController landingController;

  @override
  void onInit() {
    tanggalController = TextEditingController();
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
    tanggalController.dispose();
    namaController.dispose();
    judulController.dispose();
    jumlahController.dispose();
    belumLunasController.dispose();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      print("=====> $picked");
      selectedDate = picked;
      tanggalController.text = DateFormat('dd-MM-yyyy').format(picked);
      FocusScope.of(context).nextFocus();
      // "${picked.day}-${picked.month}-${picked.year}";

    }
  }

  void simpanTransaksi(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Transaksi transaksi = Transaksi(
        tahun: int.parse(
          tanggalController.text.split('-')[2],
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
        FocusScope.of(context).requestFocus(FocusNode());
        landingController.changePage(0);
      }
    }
  }

  void resetForm() {
    tanggalController.clear();
    namaController.clear();
    judulController.clear();
    jumlahController.clear();
    belumLunasController.clear();
  }
}
