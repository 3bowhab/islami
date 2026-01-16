DateTime parsePrayerTime(String time) {
  final now = DateTime.now();
  final parts = time.split(' ');
  final clock = parts[0].split(':');

  int hour = int.parse(clock[0]);
  final int minute = int.parse(clock[1]);
  final String period = parts[1];

  if (period == 'PM' && hour != 12) hour += 12;
  if (period == 'AM' && hour == 12) hour = 0;

  return DateTime(now.year, now.month, now.day, hour, minute);
}
