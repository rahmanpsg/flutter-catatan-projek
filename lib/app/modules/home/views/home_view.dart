import 'package:catatan_projek/app/controllers/transaksi_controller.dart';
import 'package:catatan_projek/app/data/models/catatan_model.dart';

import 'package:catatan_projek/app/modules/home/views/home_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_header.dart';

class HomeView extends GetView<TransaksiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Projek'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return Column(
            children: <Widget>[
              HomeHeader(
                pemasukan: controller.formatHarga(
                  controller.pemasukan.value,
                ),
                belumLunas: controller.formatHarga(
                  controller.belumLunas.value,
                ),
                lunas: controller.formatHarga(
                  controller.pemasukan.value - controller.belumLunas.value,
                ),
              ),
              SizedBox(height: 4),
              Expanded(
                child: controller.catatans.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.library_books,
                              size: 52,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Belum ada data',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.catatans.length,
                        itemBuilder: (context, i) {
                          Catatan _catatan = controller.catatans[i];
                          return HomeCard(
                            tahun: _catatan.tahun.toString(),
                            pemasukan: controller.formatHarga(
                              _catatan.pemasukan,
                            ),
                            belumLunas: controller.formatHarga(
                              _catatan.belumLunas,
                            ),
                            transaksis: _catatan.transaksis,
                          );
                        }),
              ),
              SizedBox(height: 36),
            ],
          );
        },
      ),
    );
  }
}
