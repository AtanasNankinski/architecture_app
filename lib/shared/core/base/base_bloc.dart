import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<E, S, FX> extends Bloc<E, S> {

  BaseBloc(super.initialState);

  final _effectController = StreamController<FX>.broadcast();

  Stream<FX> get effects => _effectController.stream;

  void emitEffect(FX effect) {
    _effectController.add(effect);
  }

  Future<void> execute(FutureOr<void> Function() action);

  @override
  Future<void> close() {
    _effectController.close();
    return super.close();
  }
}
