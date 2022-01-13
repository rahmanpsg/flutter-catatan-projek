import 'package:catatan_projek/app/controllers/transaksi_controller.dart';
import 'package:catatan_projek/app/data/models/transaksi_model.dart';
import 'package:catatan_projek/app/themes/app_colors.dart';
import 'package:catatan_projek/app/utils/currency_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController tahunController;
  late TextEditingController namaController;
  late TextEditingController judulController;
  late TextEditingController jumlahController;
  late TextEditingController belumLunasController;

  late TransaksiController _transaksiController;

  late Transaksi _transaksi;

  @override
  void onInit() {
    tahunController = TextEditingController();
    namaController = TextEditingController();
    judulController = TextEditingController();
    jumlahController = TextEditingController();
    belumLunasController = TextEditingController();

    _transaksiController = Get.find<TransaksiController>();

    _transaksi = Get.arguments as Transaksi;

    setData(_transaksi);

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

  void setData(Transaksi transaksi) {
    tahunController.text = transaksi.tahun.toString();
    namaController.text = transaksi.nama;
    judulController.text = transaksi.judul;
    jumlahController.text = currencyFormat(transaksi.pemasukan);
    belumLunasController.text = currencyFormat(transaksi.belumLunas);
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

  void updateTransaksi(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      _transaksi.tahun = int.parse(tahunController.text);
      _transaksi.nama = namaController.text;
      _transaksi.judul = judulController.text;
      _transaksi.pemasukan =
          int.parse(jumlahController.text.replaceAll('.', ''));
      _transaksi.belumLunas =
          int.parse(belumLunasController.text.replaceAll('.', ''));

      _transaksi.save();
      _transaksiController.getAllTransaksi();

      resetForm();
      FocusScope.of(context).unfocus();
      Get.back();
    }
  }

  void hapusTransaksi() async {
    await _transaksi.delete();
    _transaksiController.getAllTransaksi();
    Get.back();
  }

  void resetForm() {
    tahunController.clear();
    namaController.clear();
    judulController.clear();
    jumlahController.clear();
    belumLunasController.clear();
  }
}
