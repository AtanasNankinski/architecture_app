import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/shared/styles/theme/theme.dart';
import 'package:architecture_demo/shared/styles/theme/theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(AppTheme.lightTheme) {
    on<ChangeLightThemeEvent>(_changeToLightTheme);
    on<ChangeLightThemeEvent>(_changeToDarkTheme);
  }

  void _changeToLightTheme(ChangeLightThemeEvent event, Emitter<ThemeData> emit) {
    if(state != AppTheme.lightTheme) emit(AppTheme.lightTheme);
  }

  void _changeToDarkTheme(ChangeLightThemeEvent event, Emitter<ThemeData> emit) {
    if(state != AppTheme.darkTheme) emit(AppTheme.darkTheme);
  }
}
