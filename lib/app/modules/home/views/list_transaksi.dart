import 'package:catatan_projek/app/controllers/transaksi_controller.dart';
import 'package:catatan_projek/app/data/models/transaksi_model.dart';
import 'package:catatan_projek/app/routes/app_pages.dart';
import 'package:catatan_projek/app/themes/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTransaksi extends GetView<TransaksiController> {
  const ListTransaksi({
    Key? key,
    required this.transaksi,
  }) : super(key: key);

  final Transaksi transaksi;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          Get.toNamed(Routes.DETAIL, arguments: transaksi);
        } catch (e) {
          printError(info: e.toString());
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 90,
                    maxWidth: 90,
                  ),
                  child: Text(transaksi.nama),
                ),
                SizedBox(width: 4),
                Expanded(
                  child: Text(transaksi.judul),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      controller.formatHarga(transaksi.pemasukan),
                      style: transaksi.belumLunas > 0
                          ? warningStyle
                          : primaryStyle,
                    ),
                    if (transaksi.belumLunas > 0)
                      Text(
                        controller.formatHarga(transaksi.belumLunas),
                        style: dangerStyle,
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
