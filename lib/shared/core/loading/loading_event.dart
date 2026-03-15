part of 'loading_bloc.dart';

sealed class LoadingEvent {}

final class StartLoading extends LoadingEvent {}

final class StopLoading extends LoadingEvent {}
