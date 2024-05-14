import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-mm-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Menghilangkan spasi dan karakter non-digit
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
    if (phoneNumber.length >= 10 && phoneNumber.length <= 13) {
      if (phoneNumber.length == 10) {
        return '${phoneNumber.substring(0, 4)}-${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
      } else if (phoneNumber.length == 11) {
        return '${phoneNumber.substring(0, 4)}-${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
      } else if (phoneNumber.length == 12) {
        return '${phoneNumber.substring(0, 4)}-${phoneNumber.substring(4, 8)}-${phoneNumber.substring(8)}';
      } else if (phoneNumber.length == 13) {
        return '${phoneNumber.substring(0, 4)}-${phoneNumber.substring(4, 8)}-${phoneNumber.substring(8)}';
      }
    }
    return 'Nomor tidak valid';
  }

  
}
