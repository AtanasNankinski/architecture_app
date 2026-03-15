import 'package:flutter/material.dart';

/// Class holding the different themes for the app
///
/// In this case we just hold empty dark and light themes the purpose of which is to show
/// where their place is gonna be in implementation of this architecture.
class AppTheme {
  static final lightTheme = ThemeData.light().copyWith();

  static final darkTheme = ThemeData.dark().copyWith();
}
