import 'package:shared_preferences/shared_preferences.dart';

class HelperFunaction {
  static SharedPreferences? sharedPreferences;

  static init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> put({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences?.setBool(key, value);
  }

  static bool? get({
    required String key,
  }) {
    return sharedPreferences?.getBool(key);
  }
}
