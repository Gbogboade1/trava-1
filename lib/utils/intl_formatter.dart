import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:trava/utils/regex.dart';

class TravaFormatter {
  static String formatPhone(String tel) {
    if (tel.length == 10) {
      return "${tel.substring(0, 3)} ${tel.substring(3, 6)} ${tel.substring(6)}";
    } else if (tel.length == 11) {
      return "${tel.substring(0, 4)} ${tel.substring(4, 7)} ${tel.substring(7)}";
    } else {
      tel = tel.padRight(13, "*");
      return "+${tel.substring(0, 3)} ${tel.substring(3, 6)} ${tel.substring(6, 9)} ${tel.substring(9)}";
    }
  }

  static String formatMobileNumber(
    String mobileNum, {
    bool hasCountryCode = true,
  }) {
    mobileNum = mobileNum.replaceAll(" ", '');
    if (hasCountryCode) {
      mobileNum = mobileNum.length == 10 ? mobileNum : mobileNum.substring(1);
      return mobileNum;
    } else {
      return mobileNum;
    }
  }

  static String formatDate(String date, {String? format}) {
    DateFormat formatter =
        format == null ? DateFormat("d-MM-yyyy") : DateFormat(format);
    if (date.isEmpty) {
      return formatter.format(DateTime.now());
    }
    final datetime = DateTime.tryParse(date);
    if (datetime == null) {
      return formatter.format(DateTime.now());
    }
    return formatter.format(datetime);
  }

  static DateTime formatString(String date, {String? format}) {
    // DateFormat formatter =
    //     format == null ? DateFormat("d-MM-yyyy") : DateFormat(format);
    if (date.isEmpty) {
      return DateTime.now();
    }
    final datetime = DateTime.tryParse(date);
    if (datetime == null) {
      return DateTime.now();
    }
    return datetime;
  }

  static String formatTimeDate(String date) {
    return formatDate(date, format: 'hh:mm a, dd MMMM yyyy');
  }

  static String formatTime(String date) {
    return formatDate(date, format: 'hh:mm a');
  }

  static String formatDateShort(String date) {
    return formatDate(date, format: 'MMMM d, y');
  }

  static String formatDateTime(String date) {
    return formatDate(date, format: 'y/M/d H:mm:s');
  }

  static String formatDateMedium(String date) {
    return formatDate(date, format: 'd MMMM, y. H:mm:s');
  }

  static String formatDateLong(String date) {
    return formatDate(date, format: DateFormat.yMMMMEEEEd().pattern);
  }

  static DateTime formatDateNormal(String date) {
    return formatString(date, format: ('dd, MMMM yyyy'));
  }

  static DateTime formatDateNormalForSend(String date) {
    return formatString(date, format: ('yyyy-MM-ddTH:mm:s'));
  }

  static String capitalise(String text) {
    try {
      if (text.isEmpty) {
        return text;
      } else if (text.length == 1) {
        return text.toUpperCase();
      } else {
        final textSpan = text.split(" ").map((it) {
          if (it.isEmpty) {
            return it;
          }
          if (it.length == 1) {
            return it.toUpperCase();
          }
          final firstChar = it[0];
          return "${firstChar.toUpperCase()}${it.substring(1).toLowerCase()}";
        });
        return textSpan.join(" ");
      }
    } catch (_) {
      return text;
    }
  }

  static String formatCurrency(String amount,
      {bool spaceIcon = true, bool ignoreSymbol = false, String symbol = '₦'}) {
    final formatter = NumberFormat.currency(
      locale: "en_NG",
      name: ignoreSymbol ? '' : symbol, //?? '\$',
      symbol: ignoreSymbol ? "" : "$symbol${spaceIcon ? " " : ""}",
      decimalDigits: 2,
    );
    if (amount.isEmpty || amount == "null") {
      return "$symbol -.--";
    }
    amount = amount.replaceAll(RegExp(r'[^0-9\.]'), "");
    final amountDouble = double.tryParse(amount);
    if (amountDouble == null) {
      return amount;
    }
    if (amountDouble == 0) {
      return "$symbol 0.00";
    }
    return formatter.format(amountDouble);
  }

  static String formatXML(String xmlString) {
    String parsedString = xmlString.replaceAll(xmlRegex, "");
    return parsedString.trim();
  }

  static String formatCurrencyInput(String amount) {
    final formatter = NumberFormat.currency(
      locale: "en_NG",
      name: '',
      symbol: "",
      decimalDigits: 0,
    );
    amount = amount.replaceAll(RegExp(r'[^0-9\.]'), "");
    final amountDouble = double.tryParse(amount);
    if (amountDouble == null) {
      return "";
    }
    return formatter.format(amountDouble);
  }
}

class AmountFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    try {
      if (oldValue == newValue) {
        return TextEditingValue(
          text: newValue.text,
          selection: TextSelection.collapsed(offset: newValue.text.length),
          composing: TextRange.empty,
        );
      }
      final amount = newValue.text.replaceAll(RegExp(r'[^0-9\.]'), "");

      final isValidNum = amount.isNotEmpty && int.tryParse(amount) != null;
      if (isValidNum) {
        final formattedText = TravaFormatter.formatCurrencyInput(amount);
        return TextEditingValue(
          text: formattedText,
          selection: TextSelection.collapsed(offset: formattedText.length),
          composing: TextRange.empty,
        );
      } else {
        return newValue;
      }
    } catch (e) {
      print(e);
      return oldValue;
    }
  }
}
