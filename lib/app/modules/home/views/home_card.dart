import 'package:catatan_projek/app/controllers/transaksi_controller.dart';
import 'package:catatan_projek/app/data/models/transaksi_model.dart';
import 'package:catatan_projek/app/modules/home/views/list_transaksi.dart';
import 'package:catatan_projek/app/themes/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeCard extends GetView<TransaksiController> {
  const HomeCard({
    Key? key,
    required this.tahun,
    required this.pemasukan,
    required this.belumLunas,
    required this.transaksis,
  }) : super(key: key);

  final String tahun;
  final String pemasukan;
  final String belumLunas;
  final List<Transaksi> transaksis;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 90,
                    maxWidth: 90,
                  ),
                  child: Text(
                    tahun,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      pemasukan,
                      style: warningStyle,
                    ),
                  ),
                ),
                Text(
                  belumLunas,
                  style: dangerStyle,
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
          for (var transaksi in transaksis.reversed)
            ListTransaksi(
                nama: transaksi.nama,
                judul: transaksi.judul,
                pemasukan: transaksi.pemasukan,
                belumLunas: transaksi.belumLunas)

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: <Widget>[
          //       Container(
          //         constraints: const BoxConstraints(
          //           minWidth: 90,
          //           maxWidth: 90,
          //         ),
          //         child: Text('Herlina'),
          //       ),
          //       SizedBox(width: 4),
          //       Expanded(
          //         child: Text(
          //             'Aplikasi Administrasi Mahasiswa Tingkat Akhir Fakultas Teknik UM-Pare'),
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.end,
          //         children: <Widget>[
          //           Text(
          //             '5.000.000',
          //             style: warningStyle,
          //           ),
          //           Text(
          //             '- 2.500.000',
          //             style: dangerStyle,
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 8),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: <Widget>[
          //       Container(
          //         constraints: const BoxConstraints(
          //           minWidth: 90,
          //           maxWidth: 90,
          //         ),
          //         child: Text('Adriana'),
          //       ),
          //       SizedBox(width: 4),
          //       Expanded(
          //         child: Text(
          //             'Aplikasi Administrasi Mahasiswa Tingkat Akhir Fakultas Teknik UM-Pare'),
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.end,
          //         children: <Widget>[
          //           Text(
          //             '5.000.000',
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 8),
        ],
      ),
    );
  }
}
