import 'package:flutter/material.dart';

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
    _init();
  }

  _init() async {
    _colorSchemeSeed = Colors.blue;
    _theme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: _colorSchemeSeed,
    );
  }

  @override
  String toString() {
    return super.toString();
  }

  late Color _colorSchemeSeed;
  late ThemeData _theme;
  ThemeData get theme => _theme;
  bool get isLight => _theme.brightness == Brightness.light;
  bool get isMaterial3 => _theme.useMaterial3;
  Color get colorSchemeSeed => _colorSchemeSeed;
  changeTheme({
    Brightness? brightness,
    bool? isLight,
    bool? useMaterial3,
    Color? colorSchemeSeed,
  }) {
    if (isLight != null) {
      brightness = isLight ? Brightness.light : Brightness.dark;
    }
    if (colorSchemeSeed != null) {
      _colorSchemeSeed = colorSchemeSeed;
    }
    _theme = ThemeData(
      brightness: brightness ?? theme.brightness,
      useMaterial3: useMaterial3 ?? theme.useMaterial3,
      colorSchemeSeed: colorSchemeSeed ?? _colorSchemeSeed,
    );
    notifyListeners();
  }
}
