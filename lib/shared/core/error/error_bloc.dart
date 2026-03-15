import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/shared/core/error/error.dart';

part 'error_event.dart';

class ErrorBloc extends Bloc<ErrorEvent, AppError?> {
  ErrorBloc() : super(null) {
    on<ShowError>((event, emit) {
      emit(event.error);
    });

    on<ClearError>((_, emit) {
      emit(null);
    });
  }
}
