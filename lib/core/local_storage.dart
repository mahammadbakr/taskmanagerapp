import 'package:shared_preferences/shared_preferences.dart';

Future localStorageSetString(String key, String value) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(key, value);
}

Future<String> localStorageGetString(String key) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString(key) ?? '';
}

Future<bool> localStorageRemove(String key) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  return await preferences.remove(key);
}
