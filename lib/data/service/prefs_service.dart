import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const String seenIntroKey = 'seenIntro';

  // Mark that the user has seen the intro.
  static Future<void> setIntroSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(seenIntroKey, true);
  }

  // Check if the user has seen the intro.
  static Future<bool> hasSeenIntro() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(seenIntroKey) ?? false;
  }
}
