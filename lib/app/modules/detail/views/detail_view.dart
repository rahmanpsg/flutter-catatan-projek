import 'package:catatan_projek/app/modules/detail/controllers/detail_controller.dart';
import 'package:catatan_projek/app/themes/app_colors.dart';
import 'package:catatan_projek/app/views/input_form_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Transaksi'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      controller.hapusTransaksi();
                    },
                    icon: Icon(Icons.delete),
                    label: Text("Hapus"),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                      ),
                      primary: Colors.white,
                      backgroundColor: dangerColor,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      controller.updateTransaksi(context);
                    },
                    icon: Icon(Icons.save),
                    label: Text("Update"),
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
            ],
          ),
        ),
      ),
    );
  }
}
