import 'package:intl/intl.dart';

String formatNumberWithCommas(String number) {
  final parsedNumber = int.tryParse(number.replaceAll(',', ''));

  if (parsedNumber == null) {
    throw ArgumentError('Invalid number format');
  }

  final formatter = NumberFormat('#,###', 'fa');
  return formatter.format(parsedNumber);
}


