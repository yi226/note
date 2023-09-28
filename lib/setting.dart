import 'package:flutter/material.dart';
import 'package:note/utils/io.dart' as io;

class Setting extends ChangeNotifier {
  /// Single instance
  factory Setting() => _getInstance();
  factory Setting.init() => _getInstance();
  static Setting? _instance;
  static Setting get instance => _getInstance();
  static Setting _getInstance() {
    _instance ??= Setting._internal();
    return _instance!;
  }

  /// initialize
  Setting._internal() {
    init();
  }

  init() async {
    _colorSchemeSeed = Colors.blue;
    _theme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: _colorSchemeSeed,
    );
  }

  late Color _colorSchemeSeed;
  late ThemeData _theme;
  ThemeData get theme => _theme;
  changeTheme({
    Brightness? brightness,
    bool? useMaterial3,
    Color? colorSchemeSeed,
  }) {
    _theme = ThemeData(
      brightness: brightness ?? theme.brightness,
      useMaterial3: useMaterial3 ?? theme.useMaterial3,
      colorSchemeSeed: colorSchemeSeed ?? _colorSchemeSeed,
    );
  }
}
