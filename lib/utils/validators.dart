import 'package:trava/utils/helpers.dart';
import 'package:trava/utils/regex.dart';
import 'package:trava/utils/strings.dart';

class TravaValidators {
  static String? passwordValidator(String? password) {
    if (password != null && password.length >= 8) return null;

    if (password == null || password.isEmpty) {
      return "Password field cannot be empty";
    }

    return "Password cannot be less than eight characters";
  }

  static String getCleanedNumber(String text) {
    RegExp regExp =  RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) return "Email field cannot be empty";

    if (!_validateEmail(email)) return "Please enter valid email address";

    return null;
  }

  static String? validateCardNum(String input) {
    if (input.isEmpty) {
      return fieldReq;
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      return numberIsInvalid;
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return numberIsInvalid;
  }

  static String? required(String? text) {
    if (text == null || text.isEmpty) return "This field cannot be empty";

    return null;
  }

  static String? acctNumValid(String? text) {
    return (text != null && text.isNotEmpty && text.length == 10)
        ? null
        : "Account number not completed.";
  }

  static String? nameValidator(String? name) {
    if (name != null && name.isEmpty) return "Name field cannot be empty";

    if (name != null && name.length < 2) {
      return "Name cannot be less than two characters";
    }

    return null;
  }

  static String? bvnValidator(String name) {
    if (name.isEmpty) return "BVN field cannot be empty";

    if (name.length != 11) return "BVN must be 11 digits";

    return null;
  }

  static String? phoneValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Phone field cannot be left empty';
    }
    if (value != null && value.length < 10) {
      return 'Phone number should have at least 11 digits';
    }
    if (!phoneRegex.hasMatch(value!)) {
      return 'Please enter valid mobile number';
    }

    return null;
  }

  static String? amountValidator(String? value,
      {num minAmount = 100, num? maxAmount, bool check = false}) {
    final amount = extractAmount(value);
    if (value != null && value.isEmpty) {
      return 'Amount cannot be left empty';
    } else if (amount == null || amount < minAmount) {
      return 'Please enter valid amount';
    }
    if (check && (maxAmount == null || amount > maxAmount)) {
    return 'Please enter valid amount';
    }
    return null;
  }

  static String? minLength(String? value, {int length = 1}) {
    if (value == null || (value.isEmpty)) {
      return 'This field is required';
    }
    if (value.length < length) {
      return 'The field should contain at least $length characters';
    }
    return null;
  }

  static String? minMaxLength(String value, {int length = 1, int height = 10}) {
    if ((value.isEmpty)) {
      return 'This field is required';
    }
    if (value.length < length) {
      return 'The field should contain at least $length characters';
    }
    if (value.length > height) {
      return 'The field should contain at most $height characters';
    }
    return null;
  }

  static bool _validateEmail(String value) {
    return (!mailRegEx.hasMatch(value)) ? false : true;
  }

  static String? validateCVV(String value) {
    if (value.isEmpty) {
      return fieldReq;
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }

  static String? validatePIN(String value) {
    if (value.isEmpty) {
      return fieldReq;
    }

    if (value.length < 4 || value.length > 5) {
      return "PIN is invalid";
    }
    return null;
  }

  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return fieldReq;
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }
}
