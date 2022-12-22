import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  Future storeApiKeyLocal(String name, String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(name, value);
  }

  Future<String> getApiKeyLocal(String name) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(name)!;
  }
}
