import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static SharedPreferences? _prefs;

  /// Initialize once in main()
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save methods
  static Future<void> setString(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs!.setBool(key, value);
  }

  static Future<void> setInt(String key, int value) async {
    await _prefs!.setInt(key, value);
  }

  static Future<void> setDouble(String key, double value) async {
    await _prefs!.setDouble(key, value);
  }

  static Future<void> setStringList(String key, List<String> value) async {
    await _prefs!.setStringList(key, value);
  }

  /// Get methods
  static String? getString(String key) => _prefs!.getString(key) ?? '';

  static bool getBool(String key, {bool defaultValue = false}) =>
      _prefs!.getBool(key) ?? defaultValue;

  static int getInt(String key, {int defaultValue = 0}) =>
      _prefs!.getInt(key) ?? defaultValue;

  static double getDouble(String key, {double defaultValue = 0.0}) =>
      _prefs!.getDouble(key) ?? defaultValue;

  static List<String>? getStringList(String key) =>
      _prefs!.getStringList(key) ?? [];

  /// Remove
  static Future<void> remove(String key) async {
    await _prefs!.remove(key);
  }

  /// Clear all
  static Future<void> clear() async {
    await _prefs!.clear();
  }
}
