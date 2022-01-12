import 'transaksi_model.dart';

class Catatan {
  Catatan(
      {required this.tahun,
      required this.pemasukan,
      required this.belumLunas,
      required this.transaksis});

  final int tahun;
  int pemasukan;
  int belumLunas;
  final List<Transaksi> transaksis;
}
