import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

Future<String?> get(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var value = prefs.getString(key);
  return value;
}

Future<void> save(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

bool get isDesktop =>
    Platform.isLinux || Platform.isWindows || Platform.isMacOS;

/// Whether the operating system is mobile.
bool get isMobile => Platform.isAndroid || Platform.isIOS;
