part of 'loading_bloc.dart';

sealed class LoadingEvent {}

final class StartLoading extends LoadingEvent {
  final String identifier;
  final String label;

  StartLoading(this.identifier, this.label);
}

final class StopLoading extends LoadingEvent {
  final String identifier;

  StopLoading(this.identifier);
}
