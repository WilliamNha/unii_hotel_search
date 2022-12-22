import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future storeApiKeyLocal(String name, String value) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setString(name, value);
}
