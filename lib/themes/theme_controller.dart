import 'package:flutter/material.dart';
import 'app_themes.dart';

class ThemeController extends ChangeNotifier {
  ThemeData _theme = AppThemes.verde;

  ThemeData get theme => _theme;

  void setTheme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }
}
