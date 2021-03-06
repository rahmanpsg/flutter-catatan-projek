import 'package:catatan_projek/app/modules/tambah/controllers/tambah_controller.dart';
import 'package:catatan_projek/app/themes/app_colors.dart';
import 'package:catatan_projek/app/views/input_form_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TambahView extends GetView<TambahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Transaksi'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: <Widget>[
              InputForm(
                title: 'Tahun',
                hint: 'Pilih Tahun',
                controller: controller.tahunController,
                onTap: () => controller.selectTahun(context),
              ),
              InputForm(
                title: 'Nama',
                hint: 'Masukkan Nama',
                controller: controller.namaController,
              ),
              InputForm(
                title: 'Judul',
                hint: 'Masukkan Judul',
                controller: controller.judulController,
              ),
              InputForm(
                title: 'Jumlah',
                hint: 'Masukkan Jumlah',
                controller: controller.jumlahController,
                isNumber: true,
              ),
              InputForm(
                title: 'Belum Lunas',
                hint: 'Masukkan Belum Lunas',
                controller: controller.belumLunasController,
                isNumber: true,
              ),
              SizedBox(height: 12),
              TextButton.icon(
                onPressed: () {
                  controller.simpanTransaksi(context);
                },
                icon: Icon(Icons.save),
                label: Text("Simpan"),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  primary: Colors.white,
                  backgroundColor: secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
