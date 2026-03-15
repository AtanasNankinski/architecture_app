part of 'error_bloc.dart';

@immutable
sealed class ErrorEvent {}

final class ShowError extends ErrorEvent {
  final AppError error;

  ShowError(this.error);
}

final class ClearError extends ErrorEvent {}
