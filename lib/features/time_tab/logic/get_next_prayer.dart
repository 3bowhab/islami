import 'package:islami/data/config/pray_time_data.dart';
import 'package:islami/features/time_tab/logic/parse_prayer_time.dart';

Map<String, dynamic> getNextPrayer() {
  final now = DateTime.now();

  for (int i = 0; i < PrayTimeData.prayerTimes.length; i++) {
    final prayerTime = parsePrayerTime(PrayTimeData.prayerTimes[i]);

    if (prayerTime.isAfter(now)) {
      return {
        'time': PrayTimeData.prayerTimes[i],
        'remaining': prayerTime.difference(now),
        'index': i,
      };
    }
  }

  final firstTomorrow = parsePrayerTime(
    PrayTimeData.prayerTimes.first,
  ).add(const Duration(days: 1));

  return {
    'time': PrayTimeData.prayerTimes.first,
    'remaining': firstTomorrow.difference(now),
    'index': 0,
  };
}
