import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoneyFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    String newText = NumberFormat.currency(
      locale: 'id_ID',
      symbol: '',
      decimalDigits: 0,
    ).format(value);

    return newValue.copyWith(
      text: newText,
      selection: new TextSelection.collapsed(
        offset: newText.length + 20,
      ),
    );
  }
}
