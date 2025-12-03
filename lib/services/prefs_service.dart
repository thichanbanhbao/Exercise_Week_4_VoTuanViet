import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const String _userNameKey = 'userName';
  static const String _ageKey = 'userAge';
  static const String _emailKey = 'userEmail';
  static const String _timestampKey = 'lastSavedTimestamp';

  static Future<void> saveUserData({
    required String name,
    int? age,
    String? email,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(_userNameKey, name);

    if (age != null) {
      await prefs.setInt(_ageKey, age);
    }
    if (email != null) {
      await prefs.setString(_emailKey, email);
    }

    await prefs.setString(_timestampKey, DateTime.now().toIso8601String());
  }

  static Future<String?> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_userNameKey);
  }

  static Future<void> clearAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userNameKey);
    await prefs.remove(_ageKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_timestampKey);
  }

  static Future<String?> getTimestamp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_timestampKey);
  }
}
