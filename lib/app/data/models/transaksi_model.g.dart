// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaksi_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransaksiAdapter extends TypeAdapter<Transaksi> {
  @override
  final int typeId = 0;

  @override
  Transaksi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaksi(
      tahun: fields[1] as int,
      nama: fields[2] as String,
      judul: fields[3] as String,
      pemasukan: fields[4] as int,
      belumLunas: fields[5] as int,
    )..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Transaksi obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.tahun)
      ..writeByte(2)
      ..write(obj.nama)
      ..writeByte(3)
      ..write(obj.judul)
      ..writeByte(4)
      ..write(obj.pemasukan)
      ..writeByte(5)
      ..write(obj.belumLunas);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransaksiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
