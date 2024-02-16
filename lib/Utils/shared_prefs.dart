import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  factory SharedPrefs() => _instance;

  late SharedPreferences _prefs;

  SharedPrefs._internal() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Methods to access and set values
  Future<bool> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  String getString(String key) => _prefs.getString(key) ?? '';

  // Methods to access and set values
  Future<bool> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);

  bool getBool(String key) => _prefs.getBool(key) ?? false;

  // ... other methods for different data types
}
