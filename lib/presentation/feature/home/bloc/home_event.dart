sealed class HomeEvent {}

final class ChangeTextEvent extends HomeEvent {
  final String text;

  ChangeTextEvent(this.text);
}

final class ResetTextEvent extends HomeEvent {}
