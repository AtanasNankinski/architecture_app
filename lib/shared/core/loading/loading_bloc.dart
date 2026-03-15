import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {

  LoadingBloc() : super(const LoadingState()) {
    on<StartLoading>((event, emit) {
      final newState = LoadingState(
        activeOperations: Set.from(state.activeOperations)..add(event.identifier),
        operationLabels: Map.from(state.operationLabels)..[event.identifier] = event.label,
      );
      emit(newState);
    });

    on<StopLoading>((event, emit) {
      final newState = LoadingState(
        activeOperations: Set.from(state.activeOperations)..remove(event.identifier),
        operationLabels: Map.from(state.operationLabels)..remove(event.identifier),
      );
      emit(newState);
    });
  }

  bool get isLoading => state.activeOperations.isNotEmpty;
  String? get primaryOperation => state.activeOperations.firstOrNull;
  String? get primaryOperationLabel => primaryOperation != null ? state.operationLabels[primaryOperation] : null;
}
