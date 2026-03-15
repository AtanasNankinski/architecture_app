import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/app_observer.dart';
import 'package:architecture_demo/app.dart';


void main() {
  Bloc.observer = AppObserver();

  runApp(App());
}
