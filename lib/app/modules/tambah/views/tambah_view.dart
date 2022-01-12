import 'package:catatan_projek/app/modules/tambah/views/tambah_form.dart';
import 'package:catatan_projek/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_controller.dart';

class TambahView extends GetView<TambahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Transaksi'),
        centerTitle: true,
      ),
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.all(12),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: <Widget>[
              TambahForm(
                title: 'Tanggal',
                hint: '- Pilih Tanggal -',
                controller: controller.tanggalController,
                onTap: () => controller.selectDate(context),
              ),
              TambahForm(
                title: 'Nama',
                hint: 'Masukkan Nama',
                controller: controller.namaController,
              ),
              TambahForm(
                title: 'Judul',
                hint: 'Masukkan Judul',
                controller: controller.judulController,
              ),
              TambahForm(
                title: 'Jumlah',
                hint: 'Masukkan Jumlah',
                controller: controller.jumlahController,
                isNumber: true,
              ),
              TambahForm(
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
              )
              // Container(
              //   constraints: const BoxConstraints(
              //     minWidth: 90,
              //     maxWidth: 90,
              //   ),
              //   child: Text(
              //     'Tanggal',
              //   ),
              // ),
              // Expanded(
              //   child: TextFormField(
              //     controller: controller.tanggalController,
              //     decoration: InputDecoration(
              //       hintText: '- Pilih Tanggal -',
              //     ),
              //     onTap: () {
              //       controller.selectDate(context);
              //     },
              //     readOnly: true,
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Tanggal tidak boleh kosong';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
