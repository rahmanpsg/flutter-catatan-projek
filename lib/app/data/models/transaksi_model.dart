import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'transaksi_model.g.dart';

@HiveType(typeId: 0)
class Transaksi extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  int tahun;
  @HiveField(2)
  String nama;
  @HiveField(3)
  String judul;
  @HiveField(4)
  int pemasukan;
  @HiveField(5)
  int belumLunas;

  Transaksi({
    required this.tahun,
    required this.nama,
    required this.judul,
    required this.pemasukan,
    required this.belumLunas,
  }) : id = Uuid().v1();
}
