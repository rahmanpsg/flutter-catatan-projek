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

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.simpleCurrency(
      locale: 'id_Id',
      decimalDigits: 0,
    );

    String newText = formatter.format(value).replaceAll('Rp', '');

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
