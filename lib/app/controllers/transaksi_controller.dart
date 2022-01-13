import 'dart:developer';

import 'package:catatan_projek/app/data/models/catatan_model.dart';
import 'package:catatan_projek/app/data/models/transaksi_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class TransaksiController extends GetxController {
  final List<Transaksi> _transaksis = <Transaksi>[].obs;
  final List<Catatan> catatans = <Catatan>[].obs;
  // Map<int, Transaksi> catatans = <int, Transaksi>{}.obs;
  var pemasukan = 0.obs;
  var belumLunas = 0.obs;

  late Box<Transaksi> _transaksiBox;

  final _formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

  @override
  void onInit() async {
    try {
      Hive.registerAdapter<Transaksi>(TransaksiAdapter());
      await Hive.openBox<Transaksi>('transaksis');
      _transaksiBox = Hive.box<Transaksi>('transaksis');

      // _transaksiBox.deleteFromDisk();

      getAllTransaksi();
    } catch (e) {
      print(e);
    }
    super.onInit();
  }

  bool addTransaksi(Transaksi transaksi) {
    try {
      _transaksis.add(transaksi);
      _transaksiBox.add(transaksi);
      // _transaksiBox.put('transaksi', transaksi);

      int index =
          catatans.indexWhere((catatan) => catatan.tahun == transaksi.tahun);

      if (index != -1) {
        catatans[index].transaksis.add(transaksi);

        catatans[index].pemasukan += transaksi.pemasukan;
        catatans[index].belumLunas += transaksi.belumLunas;
      } else {
        Catatan catatan = Catatan(
            tahun: transaksi.tahun,
            pemasukan: transaksi.pemasukan,
            belumLunas: transaksi.belumLunas,
            transaksis: [transaksi]);

        catatans.add(catatan);

        catatans.sort((a, b) => b.tahun - a.tahun);
      }

      pemasukan += transaksi.pemasukan;
      belumLunas += transaksi.belumLunas;

      return true;
    } catch (e) {
      printError(info: e.toString());
      return false;
    }
  }

  void getAllTransaksi() {
    try {
      resetData();
      for (var i = 0; i < _transaksiBox.values.length; i++) {
        Transaksi transaksi = _transaksiBox.getAt(i)!;
        _transaksis.add(transaksi);
      }

      groupTransaksi();
    } catch (e) {
      print(e);
    }
  }

  void groupTransaksi() {
    // membuat key berdasarkan tahun
    Set<int> keys = {};
    for (var tran in _transaksis) {
      keys.add(tran.tahun);
    }

    log(keys.toList().reversed.toString());

    keys.toList().forEach((tahun) {
      List<Transaksi> transaksis = [
        ..._transaksis.where((trans) => trans.tahun == tahun)
      ];

      int _pemasukan = 0;
      int _belumLunas = 0;

      // menghitung data per tahun
      for (var trans in transaksis) {
        _pemasukan += trans.pemasukan;
        _belumLunas += trans.belumLunas;
      }

      //  menghitung total data
      pemasukan.value += _pemasukan;
      belumLunas.value += _belumLunas;

      Catatan catatan = Catatan(
          tahun: tahun,
          pemasukan: _pemasukan,
          belumLunas: _belumLunas,
          transaksis: transaksis);

      catatans.add(catatan);
    });

    catatans.sort((a, b) => b.tahun - a.tahun);
  }

  void resetData() {
    _transaksis.clear();
    catatans.clear();
    pemasukan.value = 0;
    belumLunas.value = 0;
  }

  String formatHarga(int harga) {
    return _formatCurrency.format(harga);
  }
}
