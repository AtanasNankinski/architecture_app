import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<E, S, FX> extends Bloc<E, S> {
  final _effectController = StreamController<FX>.broadcast();

  BaseBloc(super.initialState);

  Stream<FX> get effects => _effectController.stream;

  void emitEffect(FX effect) {
    _effectController.add(effect);
  }

  Future<void> execute(FutureOr<void> Function() action, String operationId, String operationLabel);

  @override
  Future<void> close() {
    _effectController.close();
    return super.close();
  }
}
