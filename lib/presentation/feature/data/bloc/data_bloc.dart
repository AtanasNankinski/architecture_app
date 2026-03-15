import 'dart:async';

import 'package:architecture_demo/data/data_source/remote.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/shared/core/base/base_bloc.dart';
import 'package:architecture_demo/presentation/feature/data/bloc/data_effect.dart';
import 'package:architecture_demo/presentation/feature/data/bloc/data_event.dart';
import 'package:architecture_demo/presentation/feature/data/bloc/data_state.dart';
import 'package:architecture_demo/shared/core/error/error.dart';
import 'package:architecture_demo/data/model/app_data.dart';
import 'package:architecture_demo/domain/repository/data_repository.dart';

class DataBloc extends BaseBloc<DataEvent, DataState, DataEffect> {
  final IDataRepository _repository;

  DataBloc(this._repository) : super(DataState([])) {
    on<InitEvent>(_init);
    on<LoadDataEvent>(_loadData);
    on<DeleteFromDataEvent>(_delete);

    add(InitEvent());
  }

  Future<void> _init(InitEvent event, Emitter emit) async {
    List<AppData>? data;
    
    await execute(() async {
      data = await _repository.loadData();
    }, 'init_data', 'Initializing data...');
    
    if (data != null && data!.isNotEmpty) {
      emit(state.copyWith(data));
    }
  }

  Future<void> _loadData(LoadDataEvent event, Emitter<DataState> emit) async {
    List<AppData>? data;
    
    await execute(() async {
      data = await _repository.loadData();
    }, 'load_data', 'Loading data...');
    
    if (data != null && data!.isNotEmpty) {
      emit(state.copyWith(data));
    }
  }

  Future<void> _delete(DeleteFromDataEvent event, Emitter<DataState> emit) async {
    List<AppData>? newList;
    
    await execute(() async {
      newList = await _repository.deleteDataValue(event.value);
    }, 'delete_data', 'Deleting item...');
    
    if (newList != null && !listEquals(state.data, newList!)) {
      emit(state.copyWith(newList));
    }
  }

  @override
  Future<void> execute(FutureOr<dynamic> Function() action, String operationId, String operationLabel) async {
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
