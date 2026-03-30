import 'package:islami/features/time_tab/logic/parse_prayer_time.dart';

Map<String, dynamic> getNextPrayer(List<String> prayerTimes) {
  final now = DateTime.now();
  if (prayerTimes.isEmpty) return {};

  for (int i = 0; i < prayerTimes.length; i++) {
    final prayerTime = parsePrayerTime(prayerTimes[i]);

    if (prayerTime.isAfter(now)) {
      return {
        'time': prayerTimes[i],
        'remaining': prayerTime.difference(now),
        'name': ['Fajr', 'Sunrise', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'][i],
      };
    }
  }

  final firstTomorrow = parsePrayerTime(
    prayerTimes.first,
  ).add(const Duration(days: 1));

  return {
    'time': prayerTimes.first,
    'remaining': firstTomorrow.difference(now),
    'name': 'Fajr',
  };
}
