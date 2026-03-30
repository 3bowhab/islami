import 'package:intl/intl.dart';

class ApiEndPoints {
  static const String getRadioData = 'https://www.mp3quran.net/api/v3/radios?language=ar';
  static String get getAdhanData {
    String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    return 'https://api.aladhan.com/v1/timingsByCity/$date?city=cairo&country=egypt';
  }
}