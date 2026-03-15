import 'package:flutter_bloc/flutter_bloc.dart';

part 'loading_event.dart';

class LoadingBloc extends Bloc<LoadingEvent, bool> {

  LoadingBloc() : super(false) {
    on<StartLoading>((_, emit) => emit(true));
    on<StopLoading>((_, emit) => emit(false));
  }

}
