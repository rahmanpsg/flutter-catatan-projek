import 'package:catatan_projek/app/controllers/transaksi_controller.dart';
import 'package:catatan_projek/app/themes/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ListTransaksi extends GetView<TransaksiController> {
  const ListTransaksi({
    Key? key,
    required this.nama,
    required this.judul,
    required this.pemasukan,
    required this.belumLunas,
  }) : super(key: key);

  final String nama;
  final String judul;
  final int pemasukan;
  final int belumLunas;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                constraints: const BoxConstraints(
                  minWidth: 90,
                  maxWidth: 90,
                ),
                child: Text(nama),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(judul),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    controller.formatHarga(pemasukan),
                    style: belumLunas > 0 ? warningStyle : primaryStyle,
                  ),
                  if (belumLunas > 0)
                    Text(
                      '- ${controller.formatHarga(belumLunas)}',
                      style: dangerStyle,
                    ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
