import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharePrefs {

  read(key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, List value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(value));
  }

  update(key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.getStringList(key);
  }
}