import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static Future<bool> saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<bool> saveInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }

  static Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<bool> saveDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(key, value);
  }

  static Future<double?> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool> saveList(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, json.encode(value));
  }

  static Future<List<String>?> getList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);
    return data == null ? null : List<String>.from(json.decode(data));
  }

  static Future<bool> saveMap(String key, Map<String, String> value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, json.encode(value));
  }

  static Future<Map<String, String>?> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);
    return data == null ? null : Map<String, String>.from(json.decode(data));
  }

}
