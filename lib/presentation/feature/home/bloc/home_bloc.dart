import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/presentation/feature/home/bloc/home_effect.dart';
import 'package:architecture_demo/presentation/feature/home/bloc/home_event.dart';
import 'package:architecture_demo/shared/core/base/base_bloc.dart';
import 'package:architecture_demo/shared/core/error/error.dart';

class HomeBloc extends BaseBloc<HomeEvent, String, HomeEffect>{
  HomeBloc() : super("") {
    on<ChangeTextEvent>(_changeText);
    on<ResetTextEvent>(_resetText);
  }

  Future<void> _changeText(ChangeTextEvent event, Emitter<String> emit) async {
    await execute(() async {
      await Future.delayed(Duration(seconds: 4));

      emit(event.text);
    });
  }

  Future<void> _resetText(ResetTextEvent event, Emitter<String> emit) async {
    await execute(() {
      final bool isErrorThrown = Random().nextBool();

      isErrorThrown ? throw DefaultException() : emit("");
    });
  }

  @override
  Future<void> execute(FutureOr<void> Function() action) async {
    emitEffect(StartLoadingEffect());

    try {
      await action();
    } catch (e) {
      emitEffect(
        ShowErrorEffect(AppError.fromException(e)),
      );
    } finally {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        emitEffect(StopLoadingEffect());
      });
    }
  }
}
