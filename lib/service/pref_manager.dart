

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<SharedPreferences> get _instance async => prefs = await SharedPreferences.getInstance();
  static late SharedPreferences prefs;

  static Future<SharedPreferences> init() async {
    prefs = await _instance;
    return prefs;
  }
  static const String user_active = "user_active";


  static addDataToSF(String key, var value) async {
    prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case String:
        {
          await prefs.setString(key, value);
        }
        break;
      case int:
        {
          await prefs.setInt(key, value);
        }
        break;
      case double:
        {
          await prefs.setDouble(key, value);
        }
        break;
      case bool:
        {
          await prefs.setBool(key, value);
        }
    }
  }

  static getStringValuesSF(String key)  {
    //prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(key);
    return stringValue;
  }

  static getBoolValuesSF(String key)   {
    // prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool(key);
    return boolValue;
  }

  static getIntValuesSF(String key)  {
    // prefs = await SharedPreferences.getInstance();
    //Return int
    int? intValue = prefs.getInt(key);
    return intValue;
  }

  static getDoubleValuesSF(String key)  {
    // prefs = await SharedPreferences.getInstance();
    //Return double
    double? doubleValue = prefs.getDouble(key);
    return doubleValue;
  }

  static clearAllValuesSF() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(user_active);
    return ;
  }

}