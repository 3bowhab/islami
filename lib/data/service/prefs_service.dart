import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  static const String seenIntroKey = 'seenIntro';
  static const String mostRecentKey = 'mostRecent';
}

class PrefsService {
  // Mark that the user has seen the intro.
  static Future<void> setIntroSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PrefsKeys.seenIntroKey, true);
  }

  // Check if the user has seen the intro.
  static Future<bool> hasSeenIntro() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PrefsKeys.seenIntroKey) ?? false;
  }

  // Save a new Sura index to the most recent list.
  static Future<void> saveNewSuraList(int newIndex) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> mostList = prefs.getStringList(PrefsKeys.mostRecentKey) ?? [];
    mostList.remove(newIndex.toString());
    mostList.insert(0, newIndex.toString());
    if (mostList.length > 5) {
      mostList = mostList.sublist(0, 5);
    }
    await prefs.setStringList(PrefsKeys.mostRecentKey, mostList);
  }

  // Retrieve the list of most recent Sura indices.
  static Future<List<int>> getMostRecentSuraList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> mostRecentAsString = prefs.getStringList(PrefsKeys.mostRecentKey) ?? [];
    return mostRecentAsString.map((element) => int.parse(element)).toList();
  }
}