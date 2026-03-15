import 'dart:async';
import 'dart:math';

import 'package:architecture_demo/domain/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/presentation/feature/home/bloc/home_effect.dart';
import 'package:architecture_demo/presentation/feature/home/bloc/home_event.dart';
import 'package:architecture_demo/shared/core/base/base_bloc.dart';
import 'package:architecture_demo/shared/core/error/error.dart';

class HomeBloc extends BaseBloc<HomeEvent, String, HomeEffect>{
  final IHomeRepository _repository;

  static const String _changeTextOperation = 'change_text';
  static const String _resetTextOperation = 'reset_text';

  HomeBloc(this._repository) : super("") {
    on<ChangeTextEvent>(_changeText);
    on<ResetTextEvent>(_resetText);
  }

  Future<void> _changeText(ChangeTextEvent event, Emitter<String> emit) async {
    await execute(() async {
      final text = await _repository.getHomeText();

      emit(text);
    }, _changeTextOperation, 'Changing text...');
  }

  Future<void> _resetText(ResetTextEvent event, Emitter<String> emit) async {
    await execute(() {
      final bool isErrorThrown = Random().nextBool();

      isErrorThrown ? throw DefaultException() : emit("");
    }, _resetTextOperation, 'Resetting text...');
  }

  @override
  Future<void> execute(FutureOr<void> Function() action, String operationId, String operationLabel) async {
    emitEffect(StartLoadingEffect(operationId, operationLabel));

    try {
      await action();
    } catch (e) {
      emitEffect(
        ShowErrorEffect(AppError.fromException(e)),
      );
    } finally {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        emitEffect(StopLoadingEffect(operationId));
      });
    }
  }
}
