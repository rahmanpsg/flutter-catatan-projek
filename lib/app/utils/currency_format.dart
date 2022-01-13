import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }

    final formatter = NumberFormat.simpleCurrency(
      locale: 'id_Id',
      decimalDigits: 0,
    );

    double value = double.parse(newValue.text);

    String newText = formatter.format(value).replaceAll('Rp', '');

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

String currencyFormat(int harga) {
  final formatter = NumberFormat.simpleCurrency(
    locale: 'id_Id',
    decimalDigits: 0,
  );
  return formatter.format(harga).replaceAll('Rp', '');
}
