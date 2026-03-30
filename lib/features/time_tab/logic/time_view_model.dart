import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islami/data/api/api_manager.dart';
import 'package:islami/data/models/adhan_model/timings.dart';

class TimeViewModel extends ChangeNotifier {
  Timings? adhanTimes;
  String? greDate;
  String? hijriDate;
  String? hijriMonth;
  String? dayName;
  List<String> prayerValues = [];

  String errorMessage = '';
  bool isLoading = false;

  // Fetch adhan data from API
  Future<void> fetchAdhanData() async {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    try {
      final adhanResponse = await ApiManager().getAdhanData();
      adhanTimes = adhanResponse.data?.timings;
      // 1. ميثود التحويل
      String _convertTo12Hour(String? time24) {
        if (time24 == null || time24.isEmpty) return "";

        // الـ API بيبعت الوقت كدة "13:45 (EET)"، فبناخد أول 5 حروف بس "13:45"
        String cleanTime = time24.split(' ')[0];

        // تحويل النص لساعة ودقيقة
        DateTime tempDate = DateFormat("HH:mm").parse(cleanTime);

        // إعادة تشكيلها بنظام الـ 12 ساعة (01:45 PM)
        return DateFormat("hh:mm a").format(tempDate);
      }

      // 2. تعديل الجزء اللي بيملا الـ prayerValues جوه الـ fetchAdhanData
      if (adhanTimes != null) {
        prayerValues = [
          _convertTo12Hour(adhanTimes!.fajr),
          _convertTo12Hour(adhanTimes!.sunrise),
          _convertTo12Hour(adhanTimes!.dhuhr),
          _convertTo12Hour(adhanTimes!.asr),
          _convertTo12Hour(adhanTimes!.maghrib),
          _convertTo12Hour(adhanTimes!.isha),
        ];
      }

      String? rawDate = adhanResponse.data?.date?.gregorian?.date;
      if (rawDate != null) {
        debugPrint('Raw Gregorian Date: $rawDate');
        DateTime parsedDate =
            DateFormat('dd-MM-yyyy').format(DateTime.now()) == rawDate
            ? DateTime.now()
            : DateFormat('dd-MM-yyyy').parse(rawDate);

        greDate = DateFormat('dd MMM,\nyyyy').format(parsedDate);
      }

      hijriMonth = adhanResponse.data?.date?.hijri?.month?.en;
      String? rawHijriDate = adhanResponse.data?.date?.hijri?.date;
      if (rawHijriDate != null && hijriMonth != null) {
        DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(rawHijriDate);
        String day = DateFormat('dd').format(parsedDate);
        String year = DateFormat('yyyy').format(parsedDate);

        String monthEn = hijriMonth!;
        String shortMonth = monthEn.length >= 4
            ? monthEn.substring(0, 4)
            : monthEn;

        hijriDate = "$day $shortMonth,\n$year";
      }

      dayName = adhanResponse.data?.date?.gregorian?.weekday?.en;

      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
